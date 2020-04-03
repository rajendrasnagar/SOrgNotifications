/**
* @author : Rajendra Singh Nagar
* @date : 04/01/2020
* @description : Trigger to invoke schedular that set expiration date on Active Scratch Org object.
*/
trigger ScratchOrgTrigger on ActiveScratchOrg (after insert) {
    /*
    This has to be done as it seems, by default, expiration date is not passed in context & is always null 
    regardless of creation/edition time
    WF is used along with this, as we don't have scheduled actions for created/every time edited to meet the criteria in process builder
    */
    String hour = String.valueOf(Datetime.now().hour());
    String min = String.valueOf(Datetime.now().minute()); 
    String ss = String.valueOf(Datetime.now().second()+20);
    
    //parse to cron expression
    String nextFireTime = ss + ' ' + min + ' ' + hour + ' * * ?';
    
    SetExpirationDate s = new SetExpirationDate(); 
    System.schedule('Job Started At ' + String.valueOf(Datetime.now()), nextFireTime, s);
}