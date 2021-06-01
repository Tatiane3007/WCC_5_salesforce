public class OpportunityWrapper {
     
    public String codigo {get;set;}
    public String nome_da_venda {get;set;}
    public Decimal valor_total {get;set;}

    public OpportunityWrapper(String param1, String param2, Decimal param3){
        codigo = param1;
        nome_da_venda = param2;
        valor_total = param3;
    }

}
