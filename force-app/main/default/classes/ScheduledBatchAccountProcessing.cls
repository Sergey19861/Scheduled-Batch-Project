/**
* Created by Sergey Krivorotov.
 *
 * Demo class. Designed to replace the space character with an underscore character in "Name" field of Account records.
*/

public with sharing class ScheduledBatchAccountProcessing extends ScheduledBatch {

    public List<Account> start(Database.BatchableContext bc) {
        return Database.query('SELECT Name FROM Account');
    }

    public void execute(Database.BatchableContext bc, List<Account> accounts) {
        for (Account acc : accounts) {
            acc.Name = acc.Name.replace(' ', '_');
        }
        update accounts;
    }

    public override Type getType() {
        return ScheduledBatchAccountProcessing.class;
    }
}