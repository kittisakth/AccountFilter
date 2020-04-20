@isTest
private class DailyLeadProcessorTest {
	@testSetup
    static void setup() {
        List<Lead> lst_leads = new List<Lead>();
        for (Integer i=1; i<=200; i++){
            Lead l = new Lead(Company = 'Comp' + i, LastName='LN' + i, Status= 'Working - contacted');
            lst_leads.add(l);
        }
        insert lst_leads;
    }
    
    static testmethod void testDailyProcessorScheduledJob() {
        String sch = '0 5 12 * * ?';
        Test.startTest();
        String jobId = System.Schedule('ScheduledApexText', sch, new DailyLeadProcessor());
        
        List<Lead> lst_leads = [SELECT Id FROM Lead WHERE LeadSource = null LIMIT 200];
        system.assertEquals(200, lst_leads.size());
        
        Test.stopTest();
    }
}