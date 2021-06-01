 /* Nosso cliente tem a necessidade de construir um carrinho de compras em LWC.
 Esse carrinho vai buscar os produtos e condições de pagamento, ao finalizar o mesmo 
 será gerado uma nova oportunidade.
 Como vamos separar nosso desenvolvimento em backend e frontend, 
 primeiro vamos preparar as classes e métodos no apex. */


// Crie uma classe chamada ProductController e um método que retorne os produtos.

public with sharing class ProductController {
   
    public static list<Product2> allProducts(){

        return [SELECT Id, Name, ProductCode FROM Product2];
    }
    
}
