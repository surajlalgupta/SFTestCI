@isTest
public Class IntegrationServiceTest{
    testMethod Static void testInteg(){
        Test.setMock(WebServiceMock.class, new IntegrationServiceMock());
        Integer result = IntegrationServiceImpl.impl(2,3);
        system.assert(result == 5);
    }
}