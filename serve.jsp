<%@page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//Variáveis para armazenamneto de dados do formulário
    String vnome = request.getParameter("txtnome");
    String vdata = request.getParameter("txtdata");

//Variaveis para acessar o banco de dados
    String database = "web" ;
    String endereco = "jdbc:mysql://localhost:3307/" + database; 
    String usuario = "root";
    String senha = "";

//Driver
    String driver = "com.mysql.jdbc.Driver";

//Carregar o Driver na memoria
    Class.forName(driver);

//Criar a variavel para conectar com o banco de dados
    Connection conexao;

//Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    String sql = "INSERT INTO presenca (nome, data) VALUES (?, ?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vdata);

    stm.execute();
%>

<!-- A PARTIR DAQUI E CODIGO HTML NORMAL FORMATADO -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadrastrado</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="img/icon.png" type="image/x-icon">
</head>
<body>
    <div class="container">
        <img src="img/logo.png" alt="logo" class="logo">
        <h1>Cadastro Realizado com Sucesso!</h1>

        <div class="text-block">
            <p>Obrigado por se voluntariar para ajudar na limpeza da Casa de Deus. Sua dedicação é muito importante para nós!</p>
        </div>

        <a href="home.html" class="btn">Voltar para a página inicial</a>

        <div class="footer">@ 2025 - Casa de Deus</div>
    </div>    
</body>
</html>