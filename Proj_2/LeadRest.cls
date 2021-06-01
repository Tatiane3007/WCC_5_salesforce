@RestResource(urlMapping = '/WCC/ExampleRestLead')

//https://mindful-moose-9norme-dev-ed.my.salesforce.com/services/apexrest/WCC/ExampleRestLead

global  with sharing class LeadRest {
    
    @HttpGet
    global static void getLeads(){

        RestResponse resultRest = RestContext.response; //variavel com contexto de retorno

        List<Lead> listLeads = [SELECT Id, Name, Email, Phone FROM Lead];
        List<LeadWrapper> result = new List<LeadWrapper>();

        for(Lead l : listLeads){
            result.add(new LeadWrapper(l.Id, l.Name, l.Email, l.Phone));
        }

        resultRest.responseBody = Blob.valueOf(JSON.serialize(result));
        resultRest.statusCode = 200;
    }


    @HttpPost
    global static Id insertLeads(String lastName, String company, String statusLead, String email)
    {

        Lead leadInserido = new Lead(
            LastName = lastName,
            Company = company,
            Status = statusLead,
            Email = email
        );
        insert leadInserido;

        return leadInserido.Id;

    }

}
