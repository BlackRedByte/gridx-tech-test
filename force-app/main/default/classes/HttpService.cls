public with sharing virtual class HttpService {

    protected String BASE_ENDPOINT;

    public HttpService(String baseEndpoint) {
        BASE_ENDPOINT = baseEndpoint;
    }

    public virtual HttpRequest createRequest(String endpoint, String method, String body) {
        HttpRequest request = new HttpRequest();

        request.setEndpoint(BASE_ENDPOINT + endpoint);
        request.setMethod(method);

        if (method == 'POST') {
            request.setBody(body);
        }

        return request;
    }

    public virtual HttpResponse getResponse(String endpoint, String method, String body) {
        try {
            Http http = new Http();
            return http.send( createRequest(endpoint, method, body) );
        } catch (Exception e) {
            System.debug('HTTP error:');
            System.debug(e.getMessage());
        }

        return null;
    }
}
