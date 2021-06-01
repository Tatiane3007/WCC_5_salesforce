import { LightningElement, track } from 'lwc';

import allOpportunities from '@salesforce/apex/OpportunitySummaryController.allOpportunities';

export default class OrderSummary extends LightningElement {

    @track opportunities = [];

    // Tudo o que estiver dentro é carregado ao conectar a página.
    connectedCallback(){        
        this.findAllPurchases();
    }

    findAllPurchases(){

        allOpportunities({idOpportunit : null}).then( (response) => {

            //se der sucesso trabalhamos aqui
            console.log('retorno',response);
            this.opportunities = response;

        }).catch( (erro) => {

            //se der erro trabalhamos aqui
            console.log('erro',erro);


        });

    }

    

}
