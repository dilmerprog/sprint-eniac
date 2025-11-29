<%@page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Presença</title>
    <link rel="icon" href="img/icon.png" type="image/x-icon">

    <!-- Estilo unico -->
    <style>
        body {
            background-color: #000;
            font-family: Arial, Helvetica, sans-serif;
            color: #fff;
            margin: 0;
            padding: 30px;
        }

        h1 {
            text-align: center;
            font-size: 3rem;
            background: url("img/cor.jpg") center;
            background-size: cover;
            background-clip: text;
            color: transparent;
            animation: animate 3s linear infinite;
            margin-bottom: 30px;
            font-size: 25px;
        }

        .table-container {
            width: 90%;
            max-width: 800px;
            margin: auto;
            background: rgba(255, 255, 255, 0.05);
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 0 15px rgba(255, 204, 102, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        thead {
            background: #ffcc66;
            color:#000;
            font-weight: bold;
            font-size: 16px;
        }

        th, td {
            padding: 13px;
            border-bottom: 1px solid #444;
            text-align: left;
        }

        tr:hover {
            background: rgb(255, 255, 255, 0.07);
            transition: 0.3s;
        }

        tr:nth-child(even) {
            background: rgb(255, 255, 255, 0.07);
        }

        tr:hover {
            background: rgb(255, 204, 102, 0.15);
            transition: 0.3s;
        }

        .back-btn {
            display: block;
            width: 220px;
            margin: 30px auto 0;
            text-align: center;
            padding: 12px;
            background: #ffcc66;
            color: #000;
            font-weight: bold; 
            text-decoration: none;
            border-radius: 25px;
            transition: 0.3s;    
        }

        .back-btn:hover {
            background: #e6b85c;
        }
    </style>
</head>
<body>

    <h1>Lista de Presença</h1>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Data</th>
                </tr>
            </thead>
            <tbody>


    <%
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

        String sql = "SELECT * FROM presenca";

        PreparedStatement stm = conexao.prepareStatement(sql);

        ResultSet dados = stm.executeQuery();

    //Criar a tabela para exibir os dados
        while (dados.next()) {
            out.print("<tr>");

            out.print("<td>" + dados.getString("id") + "</td>");
            out.print("<td>" + dados.getString("nome") + "</td>");
            out.print("<td>" + dados.getString("data") + "</td>");

            out.print("</tr>");
        }
        %>
            </tbody>
        </table>
    </div>

    <a href="home.html" class="back-btn">Voltar para a página inicial</a>

</body>
</html>