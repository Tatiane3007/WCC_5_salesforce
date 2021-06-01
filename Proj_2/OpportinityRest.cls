@RestResource(urlMapping = '/WCC/ExampleRestOpp/*') //definir a rota customizada

global with sharing class OpportinityRest {
    
    @HttpGet
    global static void getOpportunities(){

        RestResponse resultRest = RestContext.response; //variavel com contexto de retorno

        List<Opportunity> oppList = [Select Id, Name, GrossTotal__c From Opportunity]; //aqui listamos todas as oportunidades

        List<OpportunityWrapper> result = new List<OpportunityWrapper>(); //instanciamos a wrapper

        for(Opportunity o : oppList){

            result.add(new OpportunityWrapper(o.Id, o.Name, o.GrossTotal__c));

        }

        resultRest.responseBody = Blob.valueOf(JSON.serialize(result));
        resultRest.statusCode = 200;

    }

}
