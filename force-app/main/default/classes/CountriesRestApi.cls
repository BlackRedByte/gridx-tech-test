public with sharing class CountriesRestApi extends RestApi {

    public CountriesRestApi() {
        super('https://restcountries.eu/rest/v2', 'CountriesHttpService');
    }

    public String getAllCountries() {
        HttpResponse response = httpService.getResponse('/all', 'GET', null);
        return response.getBody();
    }
}
