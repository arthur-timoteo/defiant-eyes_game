<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

//Dados do Banco de Dados
include("dados_banco_dados.php");

//Dados recebidos
$email = $_POST["email"];

//Variáveis auxiliares
$usuario = array();

//Configurando conexão
$conexao   = mysqli_connect($host_name,$user_name,$passoword,$data_base);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}

//Gerando query e executando
$comando   = "select id_usuario FROM tbl_usuario WHERE email='$email'";
$resultado = mysqli_query($conexao,$comando);

if ($dado = mysqli_fetch_assoc($resultado)){
	$usuario["id"]    = $dado["id_usuario"];
	echo json_encode($usuario);
}else{
	echo json_encode($usuario);
}

mysqli_free_result($resultado);
mysqli_close($conexao);

?>