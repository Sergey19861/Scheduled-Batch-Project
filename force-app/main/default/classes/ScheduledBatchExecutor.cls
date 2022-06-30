/**
 * Created by Sergey Krivorotov.
 *
 * Designed to executing Batches or scheduling Batches for execution.
 */

public with sharing class ScheduledBatchExecutor {

    public static void execute(Type classType) {
        execute(classType, 0);
    }

    public static void execute(Type classType, Integer delay) {
        ScheduledBatchParams__c params = ScheduledBatchParams__c.getValues(classType.getName());
        ScheduledBatch batch = (ScheduledBatch) classType.newInstance();
        if (delay > 0) {
            System.scheduleBatch(batch, classType.getName() + System.now().getTime(), params.Interval__c.intValue(), params.Scope__c.intValue());
        } else {
            Database.executeBatch(batch, params.Scope__c.intValue());
        }
    }
}