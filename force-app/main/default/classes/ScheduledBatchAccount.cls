/**
 * Created by Sergey Krivorotov.
 */

public with sharing class ScheduledBatchAccount extends ScheduledBatch {

    public List<Account> start(Database.BatchableContext BC) {
        return Database.query('SELECT Name FROM Account');
    }

    public void execute(Database.BatchableContext BC, List<Object> scope) {
    }
}