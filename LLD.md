# Salesforce Technical  Design

## Functional Module: Scheduled Batch Executor

### Technical Design Specification

#### DOCUMENT INFORMATION AND APPROVALS

***

##### Version History

| Version # |   Date    |      Author       |     Reason for Change     |
|:---------:|:---------:|:-----------------:|:-------------------------:|
|    0.1    | 3.07.2022 | Sergey Krivorotov | Creation of functionality | 


***

### 1. Overview

This functionality is designed to give developers a tool to create different types of async Apex logic(Scheduled Batches).

- **Purpose and Audience**

This functionality is designed to simplify and generalize the creation and execution of Scheduled Batches.

- **Supporting Project References**

[Git Hub](https://github.com/Sergey19861/Scheduled-Batch-Project)

***

### 2. Business UseCase
- The project has a demo class that shows how to schedule batch logic to replace spaces with underscores in Account Name field.

***

### 3. Design Overview

- **Entity Relationship Diagram**

  ![Project Diagram](/images/ScheduledBatchDiagram.jpg)

***

### 4. Objects Definition and Configuration

- **Picklist Value Set**

No new global picklists were introduced to implement this feature.

- **Standard Objects**

No changes have been delivered for this implementation

- **Custom Objects**

No new Custom Objects were introduced to implement this feature.

***

### 5. Security Setup

- **Profiles**

There are no new profiles introduced for this feature.

- **Permission Sets**

|  Permission Set  | License Type |              Description (Access and assignment)              |
|:----------------:|:------------:|:-------------------------------------------------------------:|
| Scheduled Batch  |     None     | Uses to give access to Scheduled Batch Executor functionality |

- **Sharing Settings**

No changes in sharing setting related to any object as part of this feature.

***

### 6. User experience

To use this functionality, extend the ScheduledBatch class then override execute(),
start() and getType() methods with your logic inside.

***

### 7. Standard Setup Configurations

- **List View Change**

|    #     | List View Name   | Assignment (RT/Profiles) |         Changes made                |                    Comments                   |
|:--------:|:----------------:|:------------------------:|:-----------------------------------:|:---------------------------------------------:|
|    1     |       All        |      For all users       | Added fields: Attempts and Interval | Added this list view for ScheduledBatchParams |

***

### 8. Custom Setup Configurations

|          Name          |         API name         |      Type       |              Access              |
|:----------------------:|:------------------------:|:---------------:|:--------------------------------:|
| ScheduledBatchParams   | ScheduledBatchParams__c  | Custom Settings | Scheduled Batch(permission set)  | 


ScheduledBatchParams

| Field label |  API name   |  Type  |                   Significance                   |              Access              |
|:-----------:|:-----------:|:------:|:------------------------------------------------:|:--------------------------------:|
|  Attempts   | Attempts__c | Number | Define how many times the logic will be executed | Scheduled Batch(permission set)  | 
|  Interval   | Interval__c | Number |  Define how many minutes between next attempts   | Scheduled Batch (permission set) |

***

### 9. Apex Business Logic

| Name                            | Type            | Description                                                                                                          |
|:--------------------------------|:----------------|:---------------------------------------------------------------------------------------------------------------------|
| ScheduledBatch                  | Apex Class      | Parent class for Batches. Extend this class to implement Batches for ScheduledBatchExecutor.                         | 
| ScheduledBatchAccountProcessing | Apex Class      | Demo class. Designed to replace the space character with an underscore character in "Name" field of Account records. |
| ScheduledBatchExecutor          | Apex Class      | Designed to executing Batches or scheduling Batches for execution.                                                   |
| ScheduledBatchExecutorTest      | Unit Test Class | Contains test logic for ScheduledBatchExecutor.                                                                      |


***

### 10. Lightning Components

No new Lightning Components were introduced to implement this feature.

***

### 11. Destructive Changes

List of classes, components, fields, objects, rule and other entities which were deleted during work on Epic/Feature.

***

### 12. Review and Sign Off

- **DOCUMENT REVIEWS**


- **DOCUMENT APPROVALS**
 
