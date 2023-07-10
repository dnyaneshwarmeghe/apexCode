public with sharing class dm_DMLOperation {
   //with sharing is to enabled the record level security
   @TestVisible
   private static Boolean inducedException=false;

   //get Records
   public static List<Contact> getContactList()
   {
    try {
        if(inducedException)
        {
            throw new System.DMLException('Test Exception');
        }
        List<Contact> contactList=[SELECT Id, firstName,LastName FROM Contact];
        System.debug('14::contactList::'+ contactList);
        return contactList;        
    } catch (Exception ex) {
        System.debug('17::error::'+ ex);   
        throw ex;     
    }
   }

   //Insert List of Contacts
   public static List<Contact> insertContacts(List<Contact> result)
   {
    try {
        if(result == null || result.size()==0)
        {
            throw new System.DMLException('Parameter result of Type List<Contact>  cannot be Null or Size less than 1');
        }
        insert result;
        System.debug('32::result:: Records get inserted SuccesFully.------  Total='+ result.size());
        return result;
    } catch (Exception ex) {
        System.debug('35::error::'+ ex);
        throw ex;        
    }
   }

   //Update List of Contacts
   public static List<Contact> updateContacts(List<Contact> result)
   {
    try {
        if(result == null || result.size()==0)
        {
            throw new System.DMLException('Parameter result of Type List<Contact> cannot be Null or Size less than 1');
        }
        for(Contact conObj:result)
        {
            conObj.Email='salesforce@gmail.com';
        }
        update result;
        System.debug('53::result:: Records get updated SuccessFully.------  Total='+ result.size());
        contact ContactObj = [SELECT Id, firstName,LastName, Email FROM Contact WHERE Email='salesforce@gmail.com'];
        System.debug('54::Contact result::'+ ContactObj.Email);       
        return result;
    } catch (Exception ex) {
        System.debug('52::error::'+ ex);
        throw ex;        
    }
   }

   //Delete List of Contacts
   public static List<Contact> deleteContacts(List<Contact> result)
   {
    try {
        if(result ==null || result.size()==0)
        {
            throw new System.DMLException('Parameter result of Type List<Contact> connot be Null or Size less than 1');
        }
        delete result;
        System.debug('66::result:: Records get delete SuccessFully.------  Total='+ result.size());
        return result;
    }catch (Exception ex) {
        System.debug('69::error::'+ ex);
        throw ex;        
    }
   }
}