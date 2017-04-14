public class RestIntegrationServiceImpl{
    public Static Integer impl(Integer a, Integer b){
        HttpResponse resp = getToken();
        String sessId = '';
        JSONParser parser = JSON.createParser(resp.getBody());
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                (parser.getText() == 'access_token')) {
                parser.nextToken();
                sessId = parser.getText();
                break;
            }
        }
        sessId = 'Bearer '+sessId;
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://surajlgupta-dev-ed.my.salesforce.com/services/apexrest/slg/restService');
        req.setMethod('POST');
        req.setHeader('content-type', 'application/json');
        req.setBody('{"a":2, "b":3}');
        req.setHeader('Authorization', sessId);
        Http http = new Http();
        HttpResponse response = http.send(req);
        
        if (response.getStatusCode() == 200){
            return Integer.ValueOf(response.getBody());
        }
        else{
            return 0;
        }
    }
    public Static HttpResponse getToken(){
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9ZL0ppGP5UrC.i6HS1DWIjnoAsoZPiA4n0QSC1CN9lCCsL0nYJamGU29ywjg04zOo64nemFIyyGQRgxDA&client_secret=7117417247964975420&username=sk.iitkgp@yahoo.com&password=pm@7046SSd3Uk2wh78nZGdObGKAY5fY4s');
        req.setMethod('POST');
        req.setTimeout(10000);
        Http http = new Http();
        HttpResponse resp = http.send(req);
        return resp;
    }
}