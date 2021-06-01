<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

//Dados do Banco de Dados
include("dados_banco_dados.php");

//Variáveis auxiliares
$usuario = array();
$resposta = [];

//Configurando conexão
$conexao   = mysqli_connect($host_name,$user_name,$passoword,$data_base);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}

//Gerando query e executando
$comando   = "SELECT a.id_usuario, a.nome, b.pontos_maximos FROM tbl_usuario AS a 
			  INNER JOIN tbl_pontos_maximos AS b 
			  ON a.id_usuario = b.id_usuario
			  ORDER BY b.pontos_maximos DESC";
$resultado = mysqli_query($conexao,$comando);

while ($dado = mysqli_fetch_assoc($resultado)){
	$usuario["id"]    = $dado["id_usuario"];
	$usuario["nome"]  = $dado["nome"];
	$usuario["pontos"] = $dado["pontos_maximos"];	
	$resposta[] = $usuario;
}

echo json_encode($resposta);
mysqli_free_result($resultado);
mysqli_close($conexao);

?>