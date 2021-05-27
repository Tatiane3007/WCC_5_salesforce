trigger OpportunityTrigger on Opportunity (after insert, before insert, before update, after update) {

    Id SERVICES = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Services').getRecordTypeId();

    if(Trigger.isAfter && Trigger.isInsert){

        List<Task> taskListVariavel = new List<Task>();

        for(Opportunity o : Trigger.New){

            if(o.RecordTypeId == SERVICES){

                Task taskVariavel = new Task();
                taskVariavel.Subject        = 'Realizar serviço';
                taskVariavel.ActivityDate   = system.Today();
                taskVariavel.WhatId         = o.Id;

                taskListVariavel.add(taskVariavel);

            }

        }

        if(taskListVariavel.size() > 0){
            insert taskListVariavel;
        }

    }

    if(Trigger.isBefore){

        for(Opportunity o : Trigger.New)
        {

            if(o.StageName == 'Closed Lost'){

                o.LossDate__c = system.today();

            }else{

                o.LossDate__c = null;

            }

        }

    }

    if(Trigger.isAfter && Trigger.isUpdate){

        List<Id> idsOportunidades = new List<Id>();
        for(Opportunity o : Trigger.new){

            if(o.RecordTypeId == SERVICES && o.StageName == 'Closed Lost')
            {

                idsOportunidades.add(o.Id);

            }

        }

        system.debug('idsOportunidades '+idsOportunidades);

        if(idsOportunidades.size() > 0)
        {

            delete [Select Id From Task Where WhatId In :idsOportunidades];

        }

    }

    if(Trigger.isAfter && Trigger.isUpdate){

        List<Id> idsOportunidades = new List<Id>();

        for(Opportunity o : Trigger.new){

            if(o.RecordTypeId == SERVICES && o.StageName == 'Closed Won'){

                idsOportunidades.add(o.Id);

            }

        }

        if(idsOportunidades.size() > 0){

            List<Task> taskList = new List<Task>([Select Id From Task Where WhatId In :idsOportunidades]);
            List<Task> taskToUpdate = new List<Task>();

            for(Task t : taskList){

                t.Status = 'Completed';

                taskToUpdate.add(t);

            }

            if(taskToUpdate.size() > 0){
                
                update taskToUpdate;
            
            } 

        }

    }
    
}
