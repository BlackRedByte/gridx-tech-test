public with sharing class OpportunitiesService {

    public static List<Opportunity> getAllMappedCountries() {
        CountriesRestApi countriesRestApi = new CountriesRestApi();
        return mapCountriesToOpps( countriesRestApi.getAllCountries() );
    }

    public static List<Opportunity> mapCountriesToOpps(String jsonCountries) {
        try {
            return createOppsFromCountries( deserializeCountries(jsonCountries) );
        } catch (Exception e) {
            System.debug('Unknown error:');
            System.debug(e.getMessage());
        }

        return new List<Opportunity>();
    }

    public static List<CountryWrapper> deserializeCountries(String jsonCountries) {
        try {
            List<CountryWrapper> countries = (List<CountryWrapper>)
                Json.deserialize(jsonCountries, List<CountryWrapper>.class);
            return countries;
        } catch (JSONException e) {
            System.debug('Json deserializing error');
            System.debug(e.getMessage());
        }

        return new List<CountryWrapper>();
    }

    public static List<Opportunity> createOppsFromCountries(List<CountryWrapper> countries) {
        List<Opportunity> oppsMappedFromCountries = new List<Opportunity>();

        for (CountryWrapper country : countries) {
            Opportunity opp = createOppFromCountry(country);
            if (opp != null) {
                oppsMappedFromCountries.add(opp);
            }
        }

        return oppsMappedFromCountries;
    }

    public static Opportunity createOppFromCountry(CountryWrapper country) {
        try {
            return new Opportunity(
                Name = country.name,
                ExtId__c = country.alpha3Code,
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(10)
            );
        } catch (Exception e) {
            System.debug('Couldn\'t convert country into opportunity:');
            System.debug(Json.serializePretty(country));
            System.debug('Reason:');
            System.debug(e.getMessage());
            return null;
        }
    }

    public static List<Database.UpsertResult> upsertOppsByExternalId(List<Opportunity> opps, Schema.SObjectField externalIdField) {
        return Database.upsert(opps, externalIdField, false);
    }

    public static void logErrorUpsertResults(List<Database.UpsertResult> upsertResults) {
        for (Database.UpsertResult upsertResult : upsertResults) {
            if(!upsertResult.isSuccess()) {
                System.debug('Couldn\'t upsert this opportunity:');
                for (Database.Error error : upsertResult.getErrors()) {
                    System.debug(error.getMessage());
                }
            }
        }
    }
}
