/**
 * Created by Sergey Krivorotov.
 */

public abstract with sharing class ScheduledBatch implements Database.Batchable {

    public void finish(Database.BatchableContext BC){}

}