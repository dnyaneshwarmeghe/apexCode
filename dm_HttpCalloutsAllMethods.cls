public with sharing class dm_HttpCalloutsAllMethods {
    //for single response
    @TestVisible
    private static Boolean throwException = false;
   public static JSONWrapper getCalloutResponseContents()
   {
    try {
        if(throwException)
        {
            throw new System.DmlException('custom exception');
        }
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts'+'/1');        
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        if(response.getStatusCode() ==200)
        {
           Map<String,Object> jsonResponse = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
           System.debug('14::jsonResponse::'+ jsonResponse);
           Integer userId = (Integer) jsonResponse.get('userId');
           Integer id = (Integer) jsonResponse.get('id');
           String title = (String) jsonResponse.get('title');
           String body = (String) jsonResponse.get('body');

           System.debug('19::title::'+ jsonResponse.get('title'));
         //  JSONWrapper wrapperObj = new JSONWrapper(userId,id,title,body);
           JSONWrapper wrapperObj = new JSONWrapper();
           System.debug('20::wrapperObj::'+ wrapperObj);
           return wrapperObj;
        }
        else {
            System.debug('24::response status::'+ response.getStatusCode() + '--'+ response.getStatus());
            return null;  
        }        
    } catch (Exception ex) {
        System.debug('11:error::'+ ex);        
        throw ex;
    }
   }   
/*
   //for array of response 
   public static List<JSONWrapper> getCalloutAllResponseContents()
   {
    try {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/posts');
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);        
        if(response.getStatusCode()==200)
        {
            List<Object> jsonResponseList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<JSONWrapper> wrapperList = new List<JSONWrapper>();
            for(Object obj: jsonResponseList)
            {
             Map<String,Object> responseMap = (Map<String,Object>) obj;   
             Integer userId = (Integer) responseMap.get('userId');
             Integer id = (Integer) responseMap.get('id');
             String title = (String) responseMap.get('title');
             String body = (String) responseMap.get('body');
             JSONWrapper wrapperObj = new JSONWrapper(userId,id,title,body);
             wrapperList.add(wrapperObj);                         
            }
            System.debug('59::WrapperList::'+ wrapperList);
            System.debug('59::wrappperList size::'+ wrapperList.size());
            return wrapperList;
        }
        else{ 
            System.debug('62::response error::'+ response.getStatusCode()+'-- status:: ' + response.getStatus());
            return new List<JSONWrapper>();
        }       
    } catch (Exception ex) {
        System.debug('67::error::'+ ex);
        System.debug('67::error line number::'+ ex.getLineNumber());
        throw ex;        
    }
   }
   */
   // for array of News API
   //get the API and add wrapper class accordingly it's a challeging but very very important for project point of view. get it done properly. its done for NSE Circular API and it is woring fine. 
   //https://newsapi.org/s/india-news-api 
   //http://newsapi.org/v2/top-headlines?country=us&category=business&apikey=806d430ca6b34b67bd901c8a2d7f3ff1

   public static  List<JSONWrapper.Circular> getNseApiCallouts()
   {
    try {
        if(throwException)
        {
            throw new System.DmlException('custom exception');
        }
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.nseindia.com/api/circulars');
        request.setMethod('GET');
        HttpResponse response = new Http().send(request);
        if(response.getStatusCode()==200)
        {
        Map<String,Object> jsonResponseMap = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
        System.debug('87::jsonResponseMap::'+jsonResponseMap);
        List<Object> responseList = (List<Object>) jsonResponseMap.get('data');
        System.debug('89:: responseList::'+ responseList);
        System.debug('90::responseList size::'+ responseList.size());
        //wrapper class obj               
        List<JSONWrapper.Circular> circulars = new List<JSONWrapper.Circular>(); // bcs it has array of response.       
        for(Object obj: responseList)
        {
            Map<String,Object> circularMap = (Map<String,Object>)obj;
            //wrapper class obj for single iteration 
            JSONWrapper.Circular circularObj = new JSONWrapper.Circular();
            circularObj.fileDept = (String) circularMap.get('fileDept');
            circularObj.circNumber = (String) circularMap.get('circNumber');
            circularObj.fileExt = (String) circularMap.get('fileExt');
            circularObj.sub = (String) circularMap.get('sub');
            circularObj.cirDate = (String) circularMap.get('cirDate');
            circularObj.cirDisplayDate = (String) circularMap.get('cirDisplayDate');
            circularObj.circFilename = (String) circularMap.get('circFilename');
            circularObj.circFilelink = (String) circularMap.get('circFilelink');
            circularObj.circCompany = (String) circularMap.get('circCompany');
            circularObj.circDisplayNo = (String) circularMap.get('circDisplayNo');
            circularObj.circCategory = (String) circularMap.get('circCategory');
            circularObj.circDepartment = (String) circularMap.get('circDepartment');
            circulars.add(circularObj);
        }
        System.debug('117::wrapper result::'+ circulars);
        return circulars;
        }
        else
        {
            System.debug('100::status code::'+ response.getStatusCode()+'--status:: '+ response.getStatus());
            return null;
        }
    } catch (Exception ex) {
        System.debug('90::error::'+ ex);
        throw ex;        
    }
   }  
}