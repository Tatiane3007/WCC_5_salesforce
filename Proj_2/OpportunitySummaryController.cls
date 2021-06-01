public class OpportunitySummaryController {
    
/* Crie uma classe chamada OpportunitySummaryController e um método que retorne 
todas as oportunidades */

    @AuraEnabled
    public static list<Opportunity> allOpportunities(){

        list<Opportunity> opportunitiesList = OpportunityDAO.getAllOpportunityListMetodo();

        return opportunitiesList;
    }

}
