/* Crie uma classe chamada OpportunityDAO, essa classe deve ter um método que 
    retorna uma lista com todas as oportunidades */

public with sharing class OpportunityDAO {
    
    public static list<Opportunity> getAllOppsList(){

        return [SELECT Id, Name FROM Opportunity];
    }

    /* Na classe OpportunityDAO crie um método que receba uma lista de strings 
    com os Ids das oportunidades e retorne uma lista de oportunidades filtrando por esses ids */

    public static list<Opportunity> getOppsById(list<String> pListaIds){       

        return [SELECT Id, Name FROM Opportunity WHERE Id IN : plistaIds];
    }


}
