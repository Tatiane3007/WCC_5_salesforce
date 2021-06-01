public with sharing class OpportunityRepository {
    
/* Crie uma classe chamada OpportunityRepository e um método chamado findById que 
 filtra a oportunidade desse ID e retorne uma oportunidade */

    public static Opportunity findById(String pIdOpp){

        //Opportunity Teste = [SELECT Id, Name FROM Opportunity WHERE Account.Id =: pIdOpp][0];

        //system.debug('lista teste => ' + Teste);

        //return Teste;
        return [SELECT Id, Name FROM Opportunity WHERE Account.Id =: pIdOpp][0];
    }

//OpportunityRepository.findById('0015e000006XtUlAAK');
}
