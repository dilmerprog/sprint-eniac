<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
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

        out.print("<table border='1'>");

        while (dados.next()) {
            out.print("<tr>");
                out.print("<td>");
                    out.print(dados.getString("id"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("nome"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("data"));
                out.print("</td>");

            out.print("</tr>");
        }

        out.print("</table>");
    %>
</body>
</html>