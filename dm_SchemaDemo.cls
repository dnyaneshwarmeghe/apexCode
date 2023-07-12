public with sharing class dm_SchemaDemo {
    //Method to return the all the custom object list from Org.
    // get the all the Custom Object list from org
    public static List<String> obj;
    public static List<String> getCustomObject()
    {
        try {
           obj= new List<String>();
           //1. get all the object names from  Schema 
           Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
           System.debug('11::schemaMap::'+ schemaMap);  
           //2. get all the object names only.
           Set<String> objectName=schemaMap.keySet();
           System.debug('13:: objectName::'+ objectName);
           for(String StrObj: objectName)
           {
             Schema.SObjectType sObjType = schemaMap.get(StrObj);
             Schema.DescribeSObjectResult result = sObjType.getDescribe();
             // check wheather objec is custom or not add to list;
             if(result.isCustom())
             {
                obj.add(StrObj);
             }
           }
           System.debug('24:: custom objlist::'+ obj); 
           return obj;                
        } catch (Exception ex) {
            System.debug('27::error::'+ ex);      
            System.debug('28::error line number::'+ ex.getLineNumber());
            throw ex;      
        }
    }
}