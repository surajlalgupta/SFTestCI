public class IntegrationServiceImpl{
    public Static Integer impl(Integer a, Integer b){
        IntegrationWebService.IntegrationService integ= new IntegrationWebService.IntegrationService();
        IntegrationWebService.SessionHeader_element integAuth = new IntegrationWebService.SessionHeader_element();
        HttpResponse resp = getToken();
        system.debug(resp.getBody());
        Integer statusCode = resp.getStatusCode();
        if (statusCode == 200){
            JSONParser parser = JSON.createParser(resp.getBody());
            String sessId = '';
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                    (parser.getText() == 'access_token')) {
                    parser.nextToken();
                    sessId = parser.getText();
                    break;
                }
            }
            integAuth.sessionId = sessId;
            integ.SessionHeader = integAuth;
            return integ.add(a,b);
        }
        else{
            return 0;
        }
        //return 5;
    }
    public Static HttpResponse getToken(){
        HttpRequest req = new HttpRequest();
        String endPoint = '';
        IntegrationSettings__c intSet = IntegrationSettings__c.getValues('SOAP');
        endPoint += intSet.BaseURL__c;
        endPoint += '&client_id='+intSet.ClientId__c;
        endPoint += '&client_secret='+intSet.ClientSecret__c;
        endPoint += '&username='+intSet.UserName__c;
        endPoint += '&password='+intSet.Password__c;
        req.setEndPoint(endPoint);
        req.setMethod('POST');
        req.setTimeout(10000); //in milliseconds
        Http http = new Http();
        HttpResponse resp = http.send(req);
        return resp;
    }
}