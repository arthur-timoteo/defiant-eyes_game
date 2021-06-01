<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Olhos Desafiantes - login</title>
	<!-- ↓-Especifica a descição do site  -->
	<meta name="description" content="Jogo Olhos Desafiantes">
	<!-- ↓-São as palavras chaves do site que ajuda o Motor de busca a encontrar o site obs:o Google não usa mais essa ferramenta, o bing sim  -->
	<meta name="keywords" content="Game, jogo, olhos, desafiantes">
	<!-- ↓-O Robots é usado para nao mostrar a página em pesquisas do motor de busca -->
	<meta name="robots" content="all">
	<!-- ↓-Especifica o autor do Site -->
	<meta name="author" content="PBG Corporation">
	<!-- ↓-JavaScript -->
	<script src="js/jquery.js"></script>
	<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
	<!-- ↓-Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- ↓-Font Awesome-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- ↓-CSS e o icone da página -->
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link rel="icon" href="imgs/Logo.png">
</head>
<body>
<div id="Corpo">
	<div id="topo">
		<div class="logo">
			<img src="imgs/Logo.png">
		</div>	
	</div>
	<nav id="menu">
		<ul>
				<li class="lista-menu"><a href=""  class="texto-menu"><span>
				Home</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Download.php" class="texto-menu"><span>Download</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="InfoJogo.php" class="texto-menu"><span>Informações do jogo</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Ranking.php" class="texto-menu"><span>Ranking</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="" class="texto-menu"><span>Sobre</span></a></li>
			</ul>
	</nav>
	<div id="conteudo">
		<?php 
			include("conexao_bd.php");

				//↓create connection
			$conn = new mysqli($servername, $username, $password, $nb);
			//↓check connection
			if($conn->connect_error) {
				echo "Banco não encontrado";
				echo "<br>";
				die();

			}
			$login = $_POST["login"];
			$_SESSION["login"] = $login;
			
			if($login == ""){
				echo"<script>javascript:alert('Faça Login para continuar!');
			javascript:window.location='logout.php';
			</script>";}

			$email = $_POST["email"];
			$senha = $_POST["senha"];
			$sql = "SELECT nome FROM tbl_usuario where email = '".$email."' and senha = '".$senha."';";
			if ($conn->query($sql) == TRUE) {
				$result = $conn->query($sql);
				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()){
					$_SESSION["nome"] = $row["nome"];
						echo "<h2 style='color:#00F'>".$_SESSION["nome"]." Está logado Graças ao Pinscher Cabeça de P***</h2>
						<script>javascript:window.location='Home.php'</script>";
					}
				}else{
				echo"<script>javascript:alert('Email ou Senha Incorretos!');
				javascript:window.location='logout.php';
				</script>";
					}
				}		
				mysqli_close($conn);		
		?>
		<img style="margin:1%" src="imgs/PBCP.jpg">
	</div>
	<footer>
		<h2>©Todos os direitos reservados | Pinscher Bicha Gamer Company | Telefone (11)2469-6924</h2>
	</footer>

</div>	
</body>
</html>