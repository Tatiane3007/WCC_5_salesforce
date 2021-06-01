@RestResource(urlMapping = '/WCC/ExampleRest/*') //definir a rota customizada


// Exemplo url ARC
// https://curious-moose-vv80a5-dev-ed.my.salesforce.com/services/apexrest/WCC/ExampleRest/12345678

global with sharing class ApiRestTest {
    
    @HttpGet
    global static void getAccount(){

        RestRequest request     = RestContext.request;
        RestResponse resultRest = RestContext.response; //variavel com contexto de retorno

        String cnpj = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        
        List<Account> result = [Select Id, Name, CNPJ__c From Account Where CNPJ__c = :cnpj];

        List<ApiRestTestWrapper> novoRetorno = new List<ApiRestTestWrapper>(); //instanciamos uma lista de wrapper

        //Aqui alimentamos a lista de wrapper
        for(Account a : result){
            novoRetorno.add( new ApiRestTestWrapper(a.Id, a.Name, a.CNPJ__c));
        }

        //aqui definimos o resultado
        resultRest.responseBody = Blob.valueOf(  JSON.serialize(novoRetorno)   ); //definiu o valor do corpo do resultado
        resultRest.statusCode = 200; //definiu o status do serviço

    }


}
