public with sharing virtual class RestApi {
    
    protected HttpService httpService;

    public RestApi(String baseEndpoint, String httpServiceClass) {
        httpService = createHttpService(baseEndpoint, httpServiceClass);
    }

    private HttpService createHttpService(String baseEndpoint, String httpServiceClass) {
        switch on httpServiceClass {
            when 'CountriesHttpService' {
                return new CountriesHttpService(baseEndpoint);
            }
            when else {
                return new HttpService(baseEndpoint);
            }
        }
    }
}
