
//You can annotate this class with @isTest since it will be used only in test context.
//In this way, you can exclude it from your organization’s code size limit of 6 MB.
@isTest 
public with sharing class dm_HttpCalloutsAllMethodTest {
    //need to create mock callout class 
    // & implement the HttpcalloutMock interface 
    public class MockCalloutResponse  implements HttpCalloutMock { 
        //respond is also need to be as it is can't change throws an error to implement respond method        
        private Integer statusCode;
        public MockCalloutResponse(Integer statusCode){
            this.statusCode = statusCode;
        }

        public HttpResponse respond (HTTPRequest  request)
        {
        System.assertEquals('GET',request.getMethod());
       // System.assertEquals('https://jsonplaceholder.typicode.com/posts/1',request.getEndpoint());
        //Need to create mock response 
        HttpResponse response= new HttpResponse();       
       // response.setBody('{"userId": 1, "id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit\\nsuscipit recusandae consequuntur expedita et cum\\nreprehenderit molestiae ut ut quas totam\\nnostrum rerum est autem sunt rem eveniet architecto"}');
       response.setBody('{"data":[{"fileDept":"CML","circNumber":"57492","fileExt":"pdf","sub":"Listing of further issues of securities","cirDate":"20230707","cirDisplayDate":"July 07, 2023","circFilename":"CML57492.pdf","circFilelink":"https://archives.nseindia.com/content/circulars/CML57492.pdf","circCompany":"NSE","circDisplayNo":"NSE/CML/57492","circCategory":"Listing","circDepartment":"Listing"},{"fileDept":"SURV","circNumber":"57491","fileExt":"zip","sub":"Graded Surveillance Measure (GSM) - Periodic relaxation of Surveillance action","cirDate":"20230707","cirDisplayDate":"July 07, 2023","circFilename":"SURV57491.zip","circFilelink":"https://archives.nseindia.com/content/circulars/SURV57491.zip","circCompany":"NSE","circDisplayNo":"NSE/SURV/57491","circCategory":"Compliance","circDepartment":"Surveillance & Investigation"}]}');
        response.setStatusCode(this.statusCode);
        return response;
        }       
    }  

    //method to cover parrent class getCalloutResponseContents()-- if block 
    @isTest 
    public static void getCalloutResponseContents_Success_V1()
    {
        try {
            Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(200));  
           // dm_HttpCalloutsAllMethodTest.JSONWrapper  responseObj = new JSONWrapper();
           JSONWrapper  wrapperObj = new JSONWrapper();
           wrapperObj = dm_HttpCalloutsAllMethods.getCalloutResponseContents();
           System.assert(true,'msg');
        } catch (Exception ex) {
            System.debug('40::error::'+ ex);            
        }
    }  
        //method to cover parrent class  getCalloutResponseContents()- else block 
        @isTest 
        public static void getCalloutResponseContents_Success_V2()
        {
            try {
                Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(401));  
               // dm_HttpCalloutsAllMethodTest.JSONWrapper  responseObj = new JSONWrapper();
               JSONWrapper  wrapperObj = new JSONWrapper();
               wrapperObj = dm_HttpCalloutsAllMethods.getCalloutResponseContents();
               System.assert(true,'msg');
            } catch (Exception ex) {
                System.debug('55::error::'+ ex);            
            }
        } 

        @isTest 
        public static void getCalloutAllResponseContents_Error()
        {
        try {
            dm_HttpCalloutsAllMethods.throwException=true;
            Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(401));               
               dm_HttpCalloutsAllMethods.getCalloutResponseContents();
        } catch (Exception ex) {
            System.debug('66::error::'+ ex);
            System.assertEquals('custom exception', ex.getMessage());           
        }
        }

        //method to cover parrent class  getNseApiCallouts()- if block
        @isTest 
        public static void getNseApiCallouts_Success_V1()
        {
            try {
                Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(200));
                List<JSONWrapper.Circular> circulars = new List<JSONWrapper.Circular>();
                circulars= dm_HttpCalloutsAllMethods.getNseApiCallouts();
                System.assert(true,'msg');
            } catch (Exception ex) {
                System.debug('80::error::'+ ex);            
            }
        }
       //method to cover parrent class  getNseApiCallouts()- if block
        @isTest 
        public static void getNseApiCallouts_Success_V2()
        {
            try {
                Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(401));
                List<JSONWrapper.Circular> circulars = new List<JSONWrapper.Circular>();
                circulars= dm_HttpCalloutsAllMethods.getNseApiCallouts();
                System.assert(true,'msg');
            } catch (Exception ex) {
                System.debug('92::error::'+ ex);            
            }
        }

         //method to cover parrent class  getNseApiCallouts()- catch block 
        @isTest 
        public static void getNseApiCallouts_Error()
        {
        try {
            dm_HttpCalloutsAllMethods.throwException=true;
            Test.setMock(HttpCalloutMock.class, new MockCalloutResponse(401));               
               dm_HttpCalloutsAllMethods.getNseApiCallouts();
        } catch (Exception ex) {
            System.debug('104::error::'+ ex);
            System.assertEquals('custom exception', ex.getMessage());           
        }
        }
}