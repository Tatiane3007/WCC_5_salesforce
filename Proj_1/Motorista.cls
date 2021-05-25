public with sharing class Motorista {

    public static void girarChave(Boolean pgirarChave) {

        System.debug('Carro Ligado?' + Carro.LigarMotor(pgirarChave));

    }

    public static Boolean pisarAcelerador(Boolean pacelerou){

        System.debug('Motorista acelerou? ' + Carro.Acelerar(pacelerou));

        return Carro.Acelerar(pacelerou);
    }

    /* - Na classe do motorista crie um método chamado FrearCarro, 
    esse método deve chamado o método da classe carro acelerarMetodo passando 
    o parâmetro falso de maneira fixa */

    public static void FrearCarro(){

        System.debug('Freou o carro ' + Carro.Acelerar(false));

    }

    /* - No motorista crie um método PodeAbrirPorta, antes disso você deve chamar 
    o método dessa mesma classe chamado pisarAcelerador, se o retorno desse método 
    for verdadeiro, deve-se retornar falso, pois não se pode abrir a porta com o motor 
    acelerado. Aqui deve-se alterar o método para retornar um boleano */

    public static Boolean PodeAbrirPorta(Boolean pacelerado){

        if(pisarAcelerador(pacelerado) == true){

            System.debug('Acelerou o carro! ' + false);

            return false;
        }

        System.debug('Porta Abriu!');

        return true;
    }


    /* Na classe motorista construa um metodo chamado TrocarMarcha, também construa um 
    método em Carro chamado velocidadeCarro, se o valor da marcha for um 1 retorna 10, 
    se for 2 retorna 20, se for tres retorna 30 e se for maior ou igual a 40 retorna 100 */

    public static Integer TrocarMarcha(Integer pmarcha){

        Integer vel = 0;

        if(pmarcha == 1){
            vel = 1 * Carro.velocidadoCarro();
            System.debug('Velocidade do carro: ' + vel);

            return vel;
        }
        else if(pmarcha == 2){
            vel = 2 * Carro.velocidadoCarro();
            System.debug('Velocidade do carro: ' + vel);

            return vel;
        }
        else if(pmarcha == 3){
            vel = 3 * Carro.velocidadoCarro();
            System.debug('Velocidade do carro: ' + vel);

            return vel;
        }
        else if(pmarcha == 4){

            vel = pmarcha * Carro.velocidadoCarro();
            
            if(vel >= 40){
                vel = 100;
                System.debug('Velocidade do carro: ' + vel);

                return vel;
            }
        }

        return 0;
    }

}
