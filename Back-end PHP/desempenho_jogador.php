<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

//Dados do Banco de Dados
include("dados_banco_dados.php");

//Dados recebidos
$id = $_GET["id"];
$formato_data = isset($_GET["formato_data"]) ? $_GET["formato_data"] : "";

//Variáveis auxiliares
$desempenho = array();
$resposta = [];

//Configurando conexão
$conexao   = mysqli_connect($host_name,$user_name,$passoword,$data_base);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}

//Gerando query e executando
$comando   = "SELECT a.numero_fase, a.tempo_gasto, a.pontos, a.quantidade_vidas, a.inimigos_matados, a.data FROM tbl_metrica AS a 
              INNER JOIN tbl_usuario AS b 
			  ON a.id_usuario = b.id_usuario 
			  WHERE b.id_usuario = '$id' 
			  GROUP BY a.numero_fase, a.tempo_gasto, a.pontos, a.quantidade_vidas, a.inimigos_matados, a.data 
			  HAVING a.pontos = (SELECT MAX(pontos) FROM tbl_metrica WHERE numero_fase = a.numero_fase AND id_usuario = '$id')";
$resultado = mysqli_query($conexao,$comando);

while ($dado = mysqli_fetch_assoc($resultado)){
	$desempenho["numero_fase"]    = $dado["numero_fase"];
	$desempenho["tempo_gasto"]  = $dado["tempo_gasto"];
	$desempenho["pontos"] = $dado["pontos"];	
	$desempenho["quantidade_vidas"] = $dado["quantidade_vidas"];	
	$desempenho["inimigos_matados"] = $dado["inimigos_matados"];	

	if($formato_data == ""){
		$desempenho["data"] = $dado["data"];
	} else{
		$auxiliar = date_create($dado["data"]);
		$desempenho["data"] = date_format($auxiliar, $formato_data);
	}		

	$resposta[] = $desempenho;
}

echo json_encode($resposta);
mysqli_free_result($resultado);
mysqli_close($conexao);

?>