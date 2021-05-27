@isTest
public class OpportunityTest {
    
    @isTest static void testOppInsert() 
    {
        Id SERVICES = Schema.SObjectType.Opportunity.getRecordTypeInfosByDeveloperName().get('Services').getRecordTypeId();
        
        Opportunity oppVariavel1 = new Opportunity();
        oppVariavel1.Name        = 'TESTE OPORTUNIDADE NA CLASSE';
        oppVariavel1.StageName   = 'Prospecting';
        oppVariavel1.CloseDate   = system.Today();
        oppVariavel1.RecordTypeId= SERVICES;
        insert oppVariavel1;
        
        List<Task> taskList = [Select Id from Task Where WhatId = :oppVariavel1.Id];
        system.assertEquals(taskList.size(), 1);
        
        oppVariavel1.StageName = 'Closed Won';
        update oppVariavel1;
        
    }

}
