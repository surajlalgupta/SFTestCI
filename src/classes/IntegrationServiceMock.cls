global class IntegrationServiceMock implements WebServiceMock{
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endPoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        IntegrationWebService.AddResponse_element resp = new IntegrationWebService.AddResponse_element();
        resp.result = 5;
        response.put('response_x', resp);
    }
}