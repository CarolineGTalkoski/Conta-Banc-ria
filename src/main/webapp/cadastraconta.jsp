<%-- 
    Document   : cadastraconta
    Created on : 24 de jul. de 2024, 16:00:11
    Author     : Aluno
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.contabancaria.Conta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="cadastra">
        <h1>Criando contas:</h1>
 
        <form action="cadastraconta.jsp" method="post">
            
            <label for="numero">Número conta: </label>
            <input type="text" id="numero" name="numero" value="" required="">
            </label>
            <label for="nomePessoa">Nome correntista: </label>
                <input type="text" id="nomePessoa" name="nomePessoa" value="" required="">
            </label>
            <label for="banco">Banco: </label>
                <input type="text" id="banco" name="banco" value="" required="" >
            </label>
            <input type="submit" value="Enviar">
            
        </form>
        </div>
        <%
            
            // Recuperando o ArrayList de contas da sessão ou criando um novo se não existir
        ArrayList<Conta> contas = (ArrayList<Conta>) session.getAttribute("contas");
        if (contas == null) {
            contas = new ArrayList<>();
            session.setAttribute("contas", contas);
        }
            
            String numeroS = request.getParameter("numero");         
            String nomePessoa = request.getParameter("nomePessoa");
            String banco = request.getParameter("banco");
        
        // Criando um ArrayList para armazenar as contas
    
 
    // Adicionando conta ao ArrayList
    if (numeroS != null && !numeroS.isEmpty()) {
            int numero = Integer.parseInt(numeroS);
             contas.add(new Conta(numero,nomePessoa,banco));
            }
    
        String contaSelecionada = request.getParameter("conta");
        String operacao = request.getParameter("operacao");
        String valorS = request.getParameter("valor");            
        
    if (contaSelecionada != null && operacao != null && valorS != null && !contaSelecionada.isEmpty() && !operacao.isEmpty() && !valorS.isEmpty()) {
            int numeroConta = Integer.parseInt(contaSelecionada);
            double valor = Double.parseDouble(valorS);
            
            // Encontrar a conta selecionada
            Conta conta = null;
            for (Conta c : contas) {
                if (c.getNumero() == numeroConta) {
                    conta = c;
                    break;
                }
            }
 
            // Verificar se a conta foi encontrada
            if (conta != null) {
                String msg = "";
                if (operacao.equals("saque")) {
                    msg = conta.saque(valor);
                } else if (operacao.equals("deposito")) {
                    msg = conta.deposito(valor);
                }
                out.print("<p class='result' >" + msg + "</p>");
            } else {
                out.print("<p class='result'>Conta não encontrada.</p>");
            }
        }
        
        String contaATS = request.getParameter("contaAT");
        String contaBTS = request.getParameter("contaBT");
        String valorTS = request.getParameter("valorT");     
      if (contaATS != null && contaBTS != null && valorTS != null && !contaATS.isEmpty() && !contaBTS.isEmpty() && !valorTS.isEmpty() ) {
        // Fazer a trasferência
        
        int contaAT = Integer.parseInt(contaATS);
        int contaBT = Integer.parseInt(contaBTS);
        double valorT = Double.parseDouble(valorTS);
            
        //Primeiro tentar sacar o dinheiro da conta, para saber se tem saldo
        
            // Encontrar a contaA selecionada
            Conta conta = null;
            for (Conta c : contas) {
                if (c.getNumero() == contaAT) {
                    conta = c;
                    break;
                }
            }
            
             if (conta != null) {
                String msg = "";
                msg = conta.saque(valorT);
                if (msg.equals("Saldo insuficiente para saque.")) {
                out.print("<p class='result' >" + msg + "</p>");
                } else {
                    out.print("<p class='result' >" + msg + "</p>");
                        for (Conta c : contas) {
                            if (c.getNumero() == contaBT) {
                            conta = c;
                            break;
                        }
                    }
                    msg = conta.deposito(valorT);
                    out.print("<p class='result' >" + msg + "</p>");
                }
            }
        }
 
     %>
     <hr>
     <div class="movimenta">
        <form action="cadastraconta.jsp" method="post">
            <h4>Movimentação na conta código: 
            <select id="conta" name="conta">
           <% for (Conta c : contas) { %>
           <option ><%= c.getNumero() %></option>
           <% } %>
        </select></h4>
        <input type="radio" id="saque" name="operacao" value="saque">
        <label for="saque">Saque</label>
        <input type="radio" id="deposito" name="operacao" value="deposito">
        <label for="deposito">Deposito</label> - 
        <label for="valor">Valor:
            <input type="text" id="valor" name="valor" value="" required="">
        </label>
        <input type="submit" value="Movimentar">
        </form>
        </div>
        <hr>
        
        <div class="transferencia">
        <form action="cadastraconta.jsp" method="post">
            <h4>Transferência da conta código: 
            <select id="contaAT" name="contaAT">
           <% for (Conta c : contas) { %>
           <option ><%= c.getNumero() %></option>
           <% } %>
        </select></h4>
        <h4>Para a conta código: 
            <select id="contaBT" name="contaBT">
           <% for (Conta c : contas) { %>
           <option ><%= c.getNumero() %></option>
           <% } %>
        </select></h4>
        <label for="valor">Valor:
            <input type="text" id="valorT" name="valorT" value="" required="">
        </label>
        <input type="submit" value="Transferir">
        </form>
        </div> 
        <hr>
        <div class="contas">
               
   <%        
    // As contas
    out.print("<h2>Contas Cadastradas:</h2>");
    for (Conta c : contas) {
        out.print("<h6>Informações da Conta:</h6>");
        out.print("<p>" + c.imprimirSaldo() + "</p>");
        out.print("<hr>");
    }
 
        %>
        </div>
        <hr>
        
        <hr>
        
    </body>
</html>
