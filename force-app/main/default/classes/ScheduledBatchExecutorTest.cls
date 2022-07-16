/**
 * Created by Sergey Krivorotov.
 *
 * Contains test logic for ScheduledBatchExecutor.
 */

@IsTest
private class ScheduledBatchExecutorTest {

    @TestSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            accounts.add(new Account(Name = 'Account For Batch ' + i));
        }
        insert accounts;
        insert new ScheduledBatchParams__c(
                Name = 'ScheduledBatchAccountProcessing',
                Interval__c = 1,
                Scope__c = 200
        );
    }

    @IsTest
    static void testExecute() {
        Test.startTest();
        ScheduledBatchAccountProcessing batch = new ScheduledBatchAccountProcessing();
        ScheduledBatchExecutor.execute(batch);
        Test.stopTest();
        List<Account> result =[SELECT Name FROM Account];
        System.assert(result[4].Name.contains('Account_For_Batch'), 'Record Not Processed');
        System.assertNotEquals(result[12].Name, 'Account For Batch 12');
    }

    @IsTest
    static void testExecuteDelay() {
        Test.startTest();
        ScheduledBatchAccountProcessing batch = new ScheduledBatchAccountProcessing();
        ScheduledBatchExecutor.execute(batch, 1);
        Test.stopTest();
        List<CronTrigger> cTriggers = [SELECT Id FROM CronTrigger];
        System.assertEquals(1, cTriggers.size());
    }
}