<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

//Dados do Banco de Dados
include("dados_banco_dados.php");

//Dados recebidos
$numero_fase = $_POST["numero_fase"];
$tempo_gasto = $_POST["tempo_gasto"];
$pontos = $_POST["pontos"];
$quantidade_vidas = $_POST["quantidade_vidas"];
$inimigos_matados = $_POST["inimigos_matados"];
$data = date('Y-m-d H:i:s');
$id_usuario = $_POST["id_usuario"];

//Variáveis auxiliares
$resposta = array();
$resultado = '';
$auxiliar = '';
$pontos_maximos = 0;
$fase_atual = 0;

//Configurando conexão
$conexao   = mysqli_connect($host_name,$user_name,$passoword,$data_base);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}

//Gerando query e executando
$comando1 = "SELECT MAX(pontos) AS pontos FROM tbl_metrica WHERE id_usuario = '$id_usuario' AND numero_fase = '$numero_fase';";
$resultado_consulta = mysqli_query($conexao,$comando1);

while ($dado = mysqli_fetch_assoc($resultado_consulta)){
	$resultado = intval($dado["pontos"]);
}

if($resultado < $pontos || $resultado == null){
	$comando2 = "INSERT INTO tbl_metrica (numero_fase, tempo_gasto, pontos, quantidade_vidas, inimigos_matados, data, id_usuario) 
	 		     VALUES ('$numero_fase', '$tempo_gasto', '$pontos', '$quantidade_vidas', '$inimigos_matados', '$data', '$id_usuario');";
	mysqli_query($conexao,$comando2);

	$comando3 = "SELECT SUM(a.pontos) AS pontos_maximos FROM tbl_metrica AS a INNER JOIN tbl_usuario AS b ON a.id_usuario = b.id_usuario 
				WHERE b.id_usuario = '$id_usuario' AND a.pontos = (SELECT MAX(pontos) FROM tbl_metrica WHERE numero_fase = a.numero_fase AND id_usuario = '$id_usuario')";
	$auxiliar = mysqli_query($conexao,$comando3);

	while ($dado = mysqli_fetch_assoc($auxiliar)){
		$pontos_maximos = intval($dado["pontos_maximos"]);
	}

	$comando4 = "UPDATE tbl_pontos_maximos SET pontos_maximos = '$pontos_maximos' WHERE id_usuario = '$id_usuario'";	
	mysqli_query($conexao,$comando4);
}else{
	$comando2 = "INSERT INTO tbl_metrica (numero_fase, tempo_gasto, pontos, quantidade_vidas, inimigos_matados, data, id_usuario) 
	 		     VALUES ('$numero_fase', '$tempo_gasto', '$pontos', '$quantidade_vidas', '$inimigos_matados', '$data', '$id_usuario');";
	mysqli_query($conexao,$comando2);
}

$comando5 = "SELECT fase_atual FROM tbl_usuario WHERE id_usuario = '$id_usuario'";
$resultado_consulta = mysqli_query($conexao,$comando5);

while ($dado = mysqli_fetch_assoc($resultado_consulta)){
	$fase_atual = intval($dado["fase_atual"]);
}

if(intval($numero_fase) > $fase_atual){
	$comando6 = "UPDATE tbl_usuario SET fase_atual = '$numero_fase' WHERE id_usuario = '$id_usuario'";	
	mysqli_query($conexao,$comando6);
}

if (mysqli_affected_rows($conexao)>0){
	$resposta["msg"] = "ok";
}else{
	$resposta["msg"] = "falha";
}

echo json_encode($resposta);
mysqli_close($conexao);

?>