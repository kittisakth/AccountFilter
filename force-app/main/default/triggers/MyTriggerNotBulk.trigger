trigger MyTriggerNotBulk on Account(before insert) {
    Account a = Trigger.New[0];
    system.debug(Trigger.New);
    a.Description = 'New description';
}