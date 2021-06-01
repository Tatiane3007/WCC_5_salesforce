/* Crie uma classe chamada OpportunityDAO, essa classe deve ter um método que 
    retorna uma lista com todas as oportunidades */

public with sharing class OpportunityDAO {
    
    public static List<Opportunity> getAllOpportunityListMetodo(){

        List<Opportunity> listOpportunityVariavel = [Select Id, Name, Account.CNPJ__c From Opportunity];

        system.debug('Lista com oportunidades não filtradas '+listOpportunityVariavel);

        return listOpportunityVariavel;

    }


    /* Na classe OpportunityDAO crie um método que receba uma lista de strings 
    com os Ids das oportunidades e retorne uma lista de oportunidades filtrando por esses ids */

    // OpportunityDAO.getOppsById(new list<String>{'JK450000DFGDF', '808GFDFDGFG0'});

    public static list<Opportunity> getOppsById(list<String> pListaIds){       

        return [SELECT Id, Name FROM Opportunity WHERE Id IN : plistaIds];
    }


    /* Crie um método que receba um CNPJ e retorne uma lista de oportunidades 
    filtrando o cliente que tem esse CNPJ */

    public static list<Opportunity> getOppsByCNPJ(String pOppCNPJ){

        //list<Opportunity> listaOppCNPJ = new list<Opportunity>([SELECT Id, Name FROM Opportunity WHERE Account.CNPJ__c =: pOppCNPJ]);

        //System.debug('Lista: ' + listaOppCNPJ);

        //return listaOppCNPJ;

        return [SELECT Id, Name FROM Opportunity WHERE Account.CNPJ__c =: pOppCNPJ];
    }

}
