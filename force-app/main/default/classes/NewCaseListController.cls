public class NewCaseListController {
    public List<case> getNewCases() {
        List<case> cases = [SELECT Id, CaseNumber FROM case WHERE status = 'New'];
        return cases;
    }
}