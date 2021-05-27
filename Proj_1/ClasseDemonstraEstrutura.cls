//Estrutura de uma classe
public with sharing class ClasseDemonstraEstrutura 
{

    //detro da classe temos os 
    //private ou public
    //static ou nada
    //Tipo de variavel de retorno ou void para não retornar nada
    //nome do metodo
    //dentro do metodo vai um ou mais parâmetros ou nada
    public static Boolean nomeDoMetodo(Integer parametroVariavel, Boolean parametroVariavel2)
    {

        //Declaro variaveis pertencem ao corpo do metodo
        String textoVariavel    = 'exemplo';
        Integer inteiroVariavel = 0;

        //controle de decisão
        if(parametroVariavel2 == true)
        {
            //se o parametroVariavel2 for verdadeiro eu executo o que está aqui dentro
            //corpo que fica dentro do if
        }

        //retorno tem que ser igual ao que foi declarado na construção do método
        //se for void é sem retorno
        return true;

    }

    //exemplo de multiplicação
    public static Integer exemploMultiplicacaoMetodo(Integer pValorParametro1, Integer pValorParametro2)
    {

        Integer valorFixoVariavel = 5;
        Integer resuntadoVariavel = (pValorParametro1 * pValorParametro2) + valorFixoVariavel;

        system.debug(resuntadoVariavel);

        return resuntadoVariavel;

    }

    public static Integer somaValores(Integer pValor1, Integer pValor2){

        Integer somaTotal = pValor1 + pValor2;

        if(pValor1 > 5 && pValor1 < 10){
            somaTotal += 2;
        }

        System.debug('Soma = ' + somaTotal);

        return somaTotal;
    }

    /* Crie um método em ClasseDemonstraEstrutura que multiplique o primeiro parâmetro 
    com o segundo, se o terceiro prâmetro for verdadeiro */
    
    public static Integer multiplicaValores(Integer pparam1, Integer pparam2, Boolean condicao){

        Integer resultadoMulti = 0;

        if(condicao == true){
            resultadoMulti = pparam1 * pparam2;
            System.debug('Multiplicação = ' + resultadoMulti);

            return resultadoMulti;
        }

        System.debug('Multiplicação = ' + 0);
        return 0;
    }


    /* Crie um método que leia uma lista de uma oportunidade e retorne o valor da soma dos totais */

    public static Decimal somaOportunidades(){

        list<Opportunity> listaOportunidades = new list<Opportunity>([SELECT Id, Name, GrossTotal__c FROM Opportunity]);

        Double somaValorOportunidades = 0;

        for(Opportunity valores : listaOportunidades){

            somaValorOportunidades += valores.GrossTotal__c;

        }

        System.debug('O valor da soma dos totais é: ' + somaValorOportunidades);

        return somaValorOportunidades;
    }


    /* Crie um método que receba um id de usuário e retorne as o valor total da lista 
    de oportunidades que ele é dono, se o ID for branco, retorne o total de todas as oportunidades */

    public static Decimal oportunidadesUsuario(String pIdUsuario){

        Double somaValorOppsUsuario = 0;

        if(String.isNotBlank(pIdUsuario)){ 

            list<Opportunity> listaOppUsuario = new list<Opportunity>([SELECT GrossTotal__c FROM Opportunity WHERE OwnerId =: pIdUsuario]);

            for(Opportunity values : listaOppUsuario){

                somaValorOppsUsuario += values.GrossTotal__c;
            }

        } else{

            list<Opportunity> listaOppUsuario = new list<Opportunity>([SELECT GrossTotal__c FROM Opportunity]);

            for(Opportunity values : listaOppUsuario){

                somaValorOppsUsuario += values.GrossTotal__c;
            }

        }

        System.debug('O valor das oportunidades é: ' + somaValorOppsUsuario);

        return somaValorOppsUsuario;
    }
    
    
    
    //Operações DML
    public static void demostracaoDML()
    {

        List<Opportunity> insertOppListVariavel = new List<Opportunity>();

        //Inserção de dados
        Opportunity oppVariavel1 = new Opportunity();
        oppVariavel1.Name        = 'Nome da oportunidade de exemplo 1';
        oppVariavel1.StageName   = 'Prospecting';
        oppVariavel1.CloseDate   = system.Today();        
        insertOppListVariavel.add(oppVariavel1);
        
        Opportunity oppVariavel2 = new Opportunity();
        oppVariavel2.Name        = 'Nome da oportunidade de exemplo 2';
        oppVariavel2.StageName   = 'Prospecting';
        oppVariavel2.CloseDate   = system.Today();        
        insertOppListVariavel.add(oppVariavel2);

        Opportunity oppVariavel3 = new Opportunity();
        oppVariavel3.Name        = 'Nome da oportunidade de exemplo 3';
        oppVariavel3.StageName   = 'Prospecting';
        oppVariavel3.CloseDate   = system.Today();        
        insertOppListVariavel.add(oppVariavel3);

        Opportunity oppVariavel4 = new Opportunity();
        oppVariavel4.Name        = 'Nome da oportunidade de exemplo 4';
        oppVariavel4.StageName   = 'Prospecting';
        oppVariavel4.CloseDate   = system.Today();        
        insertOppListVariavel.add(oppVariavel4);

        Opportunity oppVariavel5 = new Opportunity();
        oppVariavel5.Name        = 'Nome da oportunidade de exemplo 5';
        oppVariavel5.StageName   = 'Prospecting';
        oppVariavel5.CloseDate   = system.Today();        
        insertOppListVariavel.add(oppVariavel5);

        insert insertOppListVariavel;

        //Atualizar Dados
        Opportunity oppVariavel = [Select Id From Opportunity Where Name = 'Nome da oportunidade de exemplo' Limit 1];
        oppVariavel.Name = 'Nome da oportunidade de exemplo ATUALIZADO';
        update oppVariavel;

        //Excluir Dados
        List<Opportunity> oppVariavel = [Select Id From Opportunity Where Name = 'Nome da oportunidade de exemplo ATUALIZADO' Limit 1];
        delete oppVariavel;

        //Upsert
        Opportunity oppUpsertVariavel = new Opportunity();
        oppUpsertVariavel.Name        = 'Nova oportunidade';
        oppUpsertVariavel.StageName   = 'Qualification';
        oppUpsertVariavel.CloseDate   = system.Today();        
        upsert oppUpsertVariavel Name;

    }


}
