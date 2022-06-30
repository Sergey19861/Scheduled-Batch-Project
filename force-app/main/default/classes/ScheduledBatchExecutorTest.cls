/**
 * Created by Sergey Krivorotov.
 */

@IsTest
private class ScheduledBatchExecutorTest {

    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 30; i++) {
            accounts.add(new Account(Name = 'Account For Batch ' + i));
        }
        insert accounts;
        insert new ScheduledBatchParams__c(
                Name = 'ScheduledBatchAccountProcessing',
                Interval__c = 5,
                Scope__c = 20
        );
    }

    @IsTest
    static void testBehavior() {

        Test.startTest();
        ScheduledBatchExecutor.execute(ScheduledBatchAccountProcessing.class);
        Test.stopTest();
        List<Account> result =[SELECT Name FROM Account];
        for (Account acc : result) {
            System.debug('Account name: ' + acc.Name);
        }
    }
}