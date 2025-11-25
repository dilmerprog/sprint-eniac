<%@page language="java" import="java.sql.*" %>
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

    out.print("<h3>Dados salvas com sucesso!</h3>");
    out.print("<br>");
    out.print("<a href='home.html'>Voltar para home</a>");
%>