/**
 * Created by Sergey Krivorotov.
 */

public abstract with sharing class ScheduledBatch implements Database.Batchable<SObject> {

    public class ScheduledBatchException extends Exception {
    }

    private String settingName;

    public void setSettingName(String name) {
        settingName = name;
    }

    public void finish(Database.BatchableContext BC) {
        if (settingName != null) {
            System.debug('Inside if');
            ScheduledBatchParams__c params = ScheduledBatchParams__c.getValues(settingName);
            System.debug('Params: ' + params);
        } else {
            System.debug('Inside else');
            throw new ScheduledBatchException('Setting Name not defined' );
        }

    }

}