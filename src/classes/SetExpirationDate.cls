/**
* @author : Rajendra Singh Nagar
* @date : 04/01/2020
* @description : Get the expiration date & set it on custom expiration date field on Active Scratch Org object. 
                 It will in turn invoke WF to set reminder notification using time dependent workflow feature.
*/
global with sharing class SetExpirationDate implements Schedulable {
    /**
    * @author : Rajendra Singh Nagar
    * @date : 04/01/2020
    * @description : logic to set custom expiration date field.
    */
   global void execute(SchedulableContext SC) {
        list<ActiveScratchOrg> soList = [select id, ExpirationDate from ActiveScratchOrg 
                                                                where ExpirationDate__c=null];
        for(ActiveScratchOrg rec: soList){
            System.debug('***org ex'+rec.ExpirationDate);
            rec.ExpirationDate__c = rec.ExpirationDate;
        }
        update soList;
        
        System.abortJob(sc.getTriggerId());
   }
}