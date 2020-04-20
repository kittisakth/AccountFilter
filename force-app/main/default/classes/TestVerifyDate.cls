@isTest
private class TestVerifyDate {
    @isTest static void CheckDatesTestTrue() {
        Date D1 = date.today();
        Date D2 = D1.addDays(29);
        Date t = VerifyDate.CheckDates(D1, D2);
        System.assertEquals(t, D2);
    }
    @isTest static void DateOver() {
        Date D1 = date.today();
        Date D2 = D1.addDays(31);
        Date t = VerifyDate.CheckDates(D1, D2);
        System.assertEquals(t, D1);
    }
}