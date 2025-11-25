<%
//Variáveis para armazenamneto de dados do formulário
    String nome = request.getParameter("txtnome");
    String data = request.getParameter("txtdata");

//Variaveis para acessar o banco de dados
    String database = "web" ;
    String endereco = "jdbc:mysql://localhost:3307/" + database; 
    String usuario = "root";
    String senha = "enserir senha falta ainda";

//Driver
    String driver = "com.mysql.jdbc.Driver";


%>