public class LeadWrapper {
    
    public String codigo {get;set;}
    public String nome_do_lead {get;set;}
    public String email {get;set;}
    public String telefone {get;set;}

    public LeadWrapper(String param1, String param2, String param3, String param4){

        codigo = param1;
        nome_do_lead = param2;
        email = param3;
        telefone = param4;
    }

}
