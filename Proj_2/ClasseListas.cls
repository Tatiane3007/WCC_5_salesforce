public with sharing class ClasseListas {
    
    /* Crie um método que monte uma lista de contas e retorne uma soma de 
    contagem de quantas contas existem */

    public static Integer SomaContas(){

        Integer quantidadeContas = 0;

        list<Account> listaContas = new list<Account>([SELECT Id, Name FROM Account]);

        for(Account conta : listaContas){

            quantidadeContas += 1;

        }

        // quantidadeContas = listaContas.size();

        System.debug('A quantidade de contas existentes é: ' + quantidadeContas);

        return quantidadeContas;
    }


    /* Crie um método que monte uma lista de contas, conte e retorne quantas contas tem CNPJ */

    public static Integer SomaAccCNPJ(){

        Integer quantidadeAccCNPJ = 0;

        list<Account> listaAccCNPJ = new list<Account>([SELECT Id, Name FROM Account WHERE CNPJ__c != '']);

        for(Account contaCNPJ : listaAccCNPJ){

            quantidadeAccCNPJ += 1;

        }

        System.debug('A quantidade de contas com CNPJ é: ' + quantidadeAccCNPJ);

        return quantidadeAccCNPJ;
    }

}
