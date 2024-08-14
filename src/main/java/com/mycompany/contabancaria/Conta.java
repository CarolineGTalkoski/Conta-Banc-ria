/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.contabancaria;

import static java.lang.System.out;

/**
 *
 * @author Aluno
 */
public class Conta {
    
    private int numero;
    private String nomePessoa;
    private double saldo;
    private double limite;
    private String banco;
    
    
    public Conta(int numero, String nomePessoa, String banco){
        this.numero = numero;
        this.nomePessoa = nomePessoa;
        this.banco = banco;
        this.saldo = 0.0;
        this.limite = 0.0;
        
    
    }

    /**
     * @return the numero
     */
    public int getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }

    /**
     * @return the nomePessoa
     */
    public String getNomePessoa() {
        return nomePessoa;
    }

    /**
     * @param nomePessoa the nomePessoa to set
     */
    public void setNomePessoa(String nomePessoa) {
        this.nomePessoa = nomePessoa;
    }

    /**
     * @return the limite
     */
    public double getLimite() {
        return limite;
    }

    /**
     */
    public void setLimite() {
        if (this.saldo>0) {
        double limite = this.saldo*0.5;
        this.limite = limite; } else { 
        this.limite =0;
    }

    
    /**
     * @return the banco
     */
    public String getBanco() {
        return banco;
    }

    /**
     * @param banco the banco to set
     */
    
    public void setBanco(String banco) {
        this.banco = banco;
    }
    
    public String deposito(double valor) {
        double saldoAtual = this.saldo;
        double novoSaldo = saldoAtual + valor;
        this.saldo = novoSaldo;
        return "Depósito efetuado com sucesso!";
    }
    
     public String saque (double valor) {
        this.setLimite();
        double saldoAtual = this.saldo;
        double novoSaldo = saldoAtual;
        String msg="";
        if (saldoAtual>=valor) {
            novoSaldo = saldoAtual-valor;
            msg = "Saque efetuado com sucesso";
        } 
        else {  
            double saldoLimite = saldoAtual + this.limite;
            if (saldoLimite>=valor) {
            novoSaldo = saldoAtual-valor;
            msg = "Saque efetuado com sucesso";
            } else {
            msg = "Saldo insuficiente para saque."; }
        } 
        this.saldo = novoSaldo;
        return msg;
    }
            
        public String imprimirSaldo() {
       this.setLimite();
        String msg = "<h3>Saldo da conta: "+ this.numero +"</h3>"
                +   "<h2>Correntista: " + this.nomePessoa +"</h2>"
                + "<h2>Banco: " + this.banco + "</h2>"
                + "<h2>Saldo: " + this.saldo + "</h2>"
                + "<h2>Limite: " + this.limite + "</h2>"
                + "<h2>Saldo + Limite: " + (this.saldo+this.limite) + "</h2>";
        return msg;
    }
                
         
    }
    


