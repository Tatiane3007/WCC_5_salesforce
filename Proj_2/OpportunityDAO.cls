/* Crie uma classe chamada OpportunityDAO, essa classe deve ter um método que 
    retorna uma lista com todas as oportunidades */

public with sharing class OpportunityDAO {
    
    public static list<Opportunity> Opps(){

        list<Opportunity> listaOpp = new list<Opportunity>([SELECT Id, Name FROM Opportunity]);

        System.debug('A quantidade de contas com CNPJ é: ' + listaOpp);

        return listaOpp;
    }

    /* Na classe OpportunityDAO crie um método que receba uma lista de strings 
    com os Ids das oportunidades e retorne uma lista de oportunidades filtrando por esses ids */

    public static list<Opportunity> OportunidadeIds(list<String> plistaIds){

        list<Opportunity> listaOppIds = new list<Opportunity>([SELECT Id, Name FROM Opportunity WHERE Opportunity.Id =: plistaIds]);

        System.debug('A quantidade de contas com CNPJ é: ' + listaOppIds);

        return listaOppIds;
    }


}
