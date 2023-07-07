public class AlarmClass implements Schedulable {
    public void execute(SchedulableContext sc)
    {
        //WAP FOR INSERT RECORD INTO EMPLOYEE SOBJECT AT 11.45 PM EVERY DAY.//
        Employee__c obj = new Employee__c();
        /*
       obj.ename__c='Dnyaneshwar meghe';
       obj.job__c='manager';
       obj.deptNo__c='10';
       obj.dept_no__c=10;
       obj.salary__c=750000;
       */
        obj.ename__c='Rohit sharma';
        obj.deptno__c='20';
        obj.dept_no__c=20;
        obj.salary__c=150000;
        obj.job__c='manager';
        insert obj;
    }

}