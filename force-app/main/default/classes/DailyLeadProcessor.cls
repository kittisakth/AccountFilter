global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext ctx) {
        List<Lead> lst_leads = [SELECT Id FROM Lead WHERE LeadSource  = null LIMIT 200];
        
        List<Lead> update_leads = new List<Lead>();
        if(!lst_leads.isEmpty()) {
            for(Lead l: lst_leads) {
                l.LeadSource = 'Dreamforce';
                update_leads.add(l);
            }
            update update_leads;
        }
    }
}