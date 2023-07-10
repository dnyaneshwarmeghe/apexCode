@isTest 
public with sharing class dm_DMLOperationTest {
    @TestSetup
    static void setUpTestData(){
        Contact con = new Contact(FirstName='First',LastName ='Last');
        List<Contact> conList= new List<Contact>();
        conList.add(con);
        insert conList;        
    }

    @isTest
    public static void getContactList_Success()
    {
        try {           
            List<Contact> contactList2= dm_DMLOperation.getContactList();
            System.assertEquals(1, contactList2.size(),'msg');
        } catch (Exception ex) {
            System.debug('19::test error::'+ ex);            
        }
    }

    @isTest
    public static void getContactList_Error()
    {
        try {
            //List<contact> contactList1 = [SELECT id, FirstName, LastName, Email FROM Contact WHERE FirstName='First'];
            dm_DMLOperation.inducedException=true;         
            List<Contact> contactList2= dm_DMLOperation.getContactList();           
        } catch (Exception ex) {
            System.debug('36::test error::'+ ex); 
            System.assertEquals('Test Exception', ex.getMessage(), 'msg');           
        }
    }

    @isTest
    public static void insertContacts_Success()
    {
        try {
            List<Contact> contactList = new List<Contact>();
            Contact newContact = new Contact();
            newContact.FirstName = 'John';
            newContact.LastName = 'Doe';           
            contactList.add(newContact);      
            List<Contact> contactList2= dm_DMLOperation.insertContacts(contactList);
            System.assertEquals(1, contactList2.size(),'msg');
        } catch (Exception ex) {
            System.debug('46::test error::'+ ex);            
        }
    }

    @isTest
    public static void insertContacts_Error()
    {
        try {        
            List<Contact> contactList2= dm_DMLOperation.insertContacts(null);           
        } catch (Exception ex) {
            System.debug('57::test error::'+ ex); 
            System.assertEquals('Parameter result of Type List<Contact>  cannot be Null or Size less than 1', ex.getMessage(), 'msg');                
        }
    }

    @isTest
    public static void updateContacts_Success()
    {
        try {
            List<Contact> contactList= [SELECT Id,firstName,LastName,Email FROM contact];
            List<Contact> contactList2= dm_DMLOperation.updateContacts(contactList);
            System.debug('68::'+ contactList);
            System.assertEquals('salesforce@gmail.com', contactList2[0].Email,'msg');
        } catch (Exception ex) {
            System.debug('71::test error::'+ ex);             
        }
    }

    @isTest
    public static void updateContacts_Error()
    {
        try {           
            List<Contact> contactList2= dm_DMLOperation.updateContacts(null);          
        } catch (Exception ex) {
            System.debug('85::test error::'+ ex); 
            System.assertEquals('Parameter result of Type List<Contact> cannot be Null or Size less than 1', ex.getMessage(), 'msg');                        
        }
    }

    @isTest
    public static void deleteContacts_Success()
    {
        try {
            List<Contact> contactList= [SELECT Id,firstName,LastName,Email FROM contact];
            System.debug('91::'+ contactList.size());
            dm_DMLOperation.deleteContacts(contactList);
            List<Contact> contactList2= [SELECT Id,firstName,LastName,Email FROM contact];
            System.debug('94::'+ contactList2.size());
            System.assertEquals(0, contactList2.Size(),'msg');
        } catch (Exception ex) {
            System.debug('95::test error::'+ ex);             
        }
    }

    @isTest
    public static void deleteContacts_Error()
    {
        try {            
            List<Contact> contactList2= dm_DMLOperation.deleteContacts(null);       
        } catch (Exception ex) {
            System.debug('105::test error::'+ ex);  
            System.assertEquals('Parameter result of Type List<Contact> connot be Null or Size less than 1', ex.getMessage(), 'msg');                    
        }
    }

}