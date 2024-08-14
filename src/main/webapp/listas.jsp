<%-- 
    Document   : listas
    Created on : 24 de jul. de 2024, 15:48:06
    Author     : Aluno
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Criar um Arraylist ou Lista de Arrays</h1>
        <%
        ArrayList<String> nomes = new ArrayList<>();
        nomes.add("Pedro");
        nomes.add("José");
        nomes.add("Maria");
        
        out.println("Tamanho da lista: " + nomes.size());

        out.print("Elementos da lista: ");
        for (String nome : nomes) {
        out.print ("<br>" + nome);
            }
            
        String nomeBusca = "Maria";
        if (nomes.contains(nomeBusca)) {
        out.print("<p>"+ nomeBusca + "está na lista.</p>");
            } else {
        out.print("<p>" + nomeBusca + "não está na lista.</p>");
            }
            
        nomes.remove("José");
        out.print("<p>Elementos da lista: </p>");
        for (String nome : nomes) {
        out.print ("<br>" + nome);
            }
        %>
    </body>
</html>
