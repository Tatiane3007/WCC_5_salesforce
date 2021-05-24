public with sharing class Carro {

    public static void trocarRodas(){
        String estadoDasRodas = 'Velho';
        estadoDasRodas = 'Novo';
        system.debug('estadoDasRodas '+ estadoDasRodas);
    }

    public static void LigarFarol(){
        Boolean farolLigado = false;
        farolLigado = true;
          system.debug('farolLigado '+ farolLigado);
    } 
    
    public static Boolean LigarMotor(Boolean pgirarChave){

        Boolean motorLigado = pgirarChave ? true : false;

        return motorLigado;
    }

    public static Boolean Acelerar(Boolean pacelerou){

        Boolean acelera = pacelerou ? true : false;

        return acelera;
    }

    /* Na classe carro crie um método que se chama CorDoCarro, que recebe 
    um parâmetro de texto e escreva no log a cor do carro que recebeu no 
    parâmetro, esse método não precisa retornar nada */

    public static void CorDoCarro(String pcor){

        system.debug('Cor do carro: ' + pcor);
    }


    public static Integer velocidadoCarro(){

        System.debug('Velocidade: ' + 10);

        return 10;
    }

}
