/**
 * Created by Sergey Krivorotov.
 *
 * Parent class for Batches. Extend this class to implement Batches for ScheduledBatchExecutor.
 */

public abstract with sharing class ScheduledBatch implements Database.Batchable<SObject>, Database.Stateful {

    public class ScheduledBatchException extends Exception {
    }

    public abstract Type getType();

    public void finish(Database.BatchableContext bc) {
        ScheduledBatchParams__c params = ScheduledBatchParams__c.getValues(getType().getName());
        Long startDateMS = [SELECT CreatedDate FROM AsyncApexJob WHERE Id = :bc.getJobId()].CreatedDate.getTime();
        Long executionTimeMS = System.now().getTime() - startDateMS;
        Integer executionTimeMinutes = (executionTimeMS / 1000 / 60).intValue();
        Integer delay = params.Interval__c.intValue() - executionTimeMinutes;
        ScheduledBatchExecutor.execute(getType(), delay);
    }

}