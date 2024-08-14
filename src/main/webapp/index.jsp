<%-- 
    Document   : index
    Created on : 24 de jul. de 2024, 14:12:33
    Author     : Aluno
--%>

<%@page import="com.mycompany.contabancaria.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Conta novaConta = new Conta (123, "Fulano", "Caixa");
            out.println(novaConta.getNomePessoa());
            out.print("<br>");
            out.print(novaConta.getNumero());
            out.print("<br>");
            novaConta.setNumero(321); //consigo alterar sem setter
            out.print(novaConta.getNumero());
            
            out.print("<p>Criando nova instância </p>");
            
            Conta c = new Conta(1, "Ciclano da Silva", "Santander");
            out.print(c.getNomePessoa());
            out.print("<br>");
            out.print(c.getNumero());
            out.print("<br>");
            out.print(c.getBanco());
               
            
            String msg = "";
            
            out.print(novaConta.deposito(150.00));
            msg = novaConta.deposito(200.00);
            out.print("<br>" + msg);
            out.print(novaConta.imprimirSaldo());
            msg = novaConta.saque(50.00);
            out.print("<br>" + msg);
            out.print("<br>");
            out.print(novaConta.imprimirSaldo());
            out.print("<br>");
            msg = novaConta.saque(450.00);
            out.print("<br>Saque: " + msg);
            out.print(novaConta.imprimirSaldo());
            
            msg = c.deposito(50);
            out.print ("<br>" + msg);
            out.print (c.imprimirSaldo());
        %>
    </body>
</html>
