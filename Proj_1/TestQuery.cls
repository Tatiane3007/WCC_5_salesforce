public class TestQuery {
    
    public static List<Opportunity> TestQuery() {
        
        //Variaveis
        List<Opportunity> listaOportunidades = new List<Opportunity>([SELECT Id FROM Opportunity WHERE Account.CNPJ__c != '']);
        Boolean isBoolean   = true;
        Integer inteiros    = 1;
        Double doubleVar    = 10.50151545455;
        Decimal decimais    = 10.50;
        String text         = 'AAAAAAAAA';
        String textB        = 'BBBB';

        //Instrução para exibir o resultado no log
        system.debug('listaOportunidades '+listaOportunidades);
        system.debug('isBoolean '+isBoolean);
        system.debug('inteiros '+inteiros);

        isBoolean = false;

        //retorno do método
        return listaOportunidades;

    }

    public static void semRetorno(){

    }
    
}
