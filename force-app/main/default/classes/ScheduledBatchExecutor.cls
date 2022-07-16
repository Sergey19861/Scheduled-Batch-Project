/**
 * Created by Sergey Krivorotov.
 *
 * Designed to executing Batches or scheduling Batches for execution.
 */

public with sharing class ScheduledBatchExecutor {

    public static void execute(ScheduledBatch batch) {
        execute(batch, 0);
    }

    public static void execute(ScheduledBatch batch, Integer delay) {
        if (delay > 0) {
            System.scheduleBatch(batch, batch.getType().getName() + System.now().getTime(), batch.params.Interval__c.intValue(), batch.params.Scope__c.intValue());
        } else {
            Database.executeBatch(batch, batch.params.Scope__c.intValue());
        }
    }
}