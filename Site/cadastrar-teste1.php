<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Olhos Desafiantes - Cadastro</title>
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
			<h1>Olhos Desafiantes</h1>
		</div>	
	</div>
	<nav id="menu">
		<ul>
				<li class="lista-menu"><a href=""  class="texto-menu"><span>
				Home</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="" class="texto-menu"><span>Download</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="" class="texto-menu"><span>Informações do jogo</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="" class="texto-menu"><span>Ranking</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="" class="texto-menu"><span>Sobre</span></a></li>
			</ul>
	</nav>
	<div id="conteudo">
		<?php
			session_start();
			include("conexao_bd.php");

				//↓create connection
			$conn = new mysqli($servername, $username, $password, $nb);
			//↓check connection
			if($conn->connect_error) {
				echo "Banco não encontrado";
				echo "<br>";
				die();

			}

			$cadastro = $_POST["cadastro"];
			$_SESSION["cadastro"] = $cadastro;
			if($_SESSION["cadastro"] === ""){
				echo"<script>javascript:alert('Faça Cadastro para continuar!');
			javascript:window.location='logout.php';
			</script>";}


			if($_SESSION["cadastro"] === "Cadastrar"){
				$senha = $_POST['senha'];
				$senhac = $_POST['senhac'];
				$email = $_POST['email'];
				$nome = $_POST["nome"];
			}
			if($senha != $senhac){
				echo"<script>javascript:alert('Senha e contra-senha Diferentes!');
			javascript:window.location='logout.php';
			</script>";
			}else{
				$sql2 = "SELECT email FROM tbl_usuario where email = '".$email."';";
				if ($conn->query($sql2) == TRUE) {
					$result = $conn->query($sql2);
					if ($result->num_rows > 0) {
					echo"<script>javascript:alert('Email já Cadastrado!');
						javascript:window.location='logout.php';
						</script>";
				}else{
					$sql3 = "SELECT nome FROM tbl_usuario where nome = '".$nome."';";
					if ($conn->query($sql3) == TRUE) {
						$result = $conn->query($sql3);
						if ($result->num_rows > 0) {
						echo"<script>javascript:alert('Nome de Usuário já Cadastrado!');
							javascript:window.location='logout.php';
							</script>";
						}else{
							$sql4 = "INSERT INTO tbl_usuario VALUES (NULL,'".$nome."','".$email."','".$senha."','1','1',NOW())";
							if ($conn->query($sql4) == TRUE) {
								$id_usuario = 0;
								$sql5 = "SELECT MAX(id_usuario) FROM tbl_usuario";
								$result5 = $conn->query($sql5);
								while($row5 = $result5->fetch_assoc()){
									$id_usuario	= $row5["id_usuario"];		
								}

								$sql6 = "INSERT INTO tbl_pontos_maximos (id_usuario,pontos_maximos) VALUES ('$id_usuario',0)";
								if ($conn->query($sql4) == TRUE) {
									echo "<script>javascript:alert('Cadastrado com sucesso! \\nFaça Login para Continuar!');
									javascript:window.location='index.html';</script>";
								}
							}
							}	
						}else{
								echo "DEU ERRO :(";
						}	
					}	
				}
			}	
			

			
			
				mysqli_close($conn);		
			?>
		<img style="margin:1%" src="imgs/PBCP.jpg">
	</div>
	<footer>
		<h2>©Todos os direitos reservados | Pinscher Bicha Gamer Company | Telefone (11)2469 -6924</h2>
	</footer>

</div>	
</body>
</html>