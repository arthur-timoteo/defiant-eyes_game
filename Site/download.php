<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Olhos Desafiantes - Download</title>
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
		<?php 
		if (isset($_SESSION["login"]) == TRUE ){  
				$_SESSION["login"]; 
			    if($_SESSION["login"] === ""){
					echo "<div class='logo'>";
				}else{

				echo "<div class='logo-usua'>"; 
				}
			}else{

				echo "<div class='logo'>"; 
			}
		?>
		   <img src="imgs/Logo.png"> 
		<?php
		if (isset($_SESSION["login"]) == TRUE){
			    	if($_SESSION["login"] === "Entrar"){

					echo "<h3>".$_SESSION["nome"]." | <a class='sair' onclick='Logout()' href='logout.php'>Sair</a></h3>";
				} 
			
			}

		?>	
		
		</div>	
	</div>
	<?php
		if (isset($_SESSION["login"]) !== TRUE){
			    echo "<a class='entrarlogar' href='index.html'>Entrar/Cadastrar</a>";	
			}
			
		?>	
		
	<nav id="menu">
		<ul>
				<li class="lista-menu"><a href="Home.php" class="texto-menu"><span>
				Home</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="download.php" class="texto-menu"><span>Download</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="InfoJogo.php" class="texto-menu"><span>Informações do jogo</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Ranking.php" class="texto-menu"><span>Ranking</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Sobre.php" class="texto-menu"><span>Sobre</span></a></li>
			</ul>
	</nav>
	<div id="conteudo">
		<h2 class="titulo-pagina">Download</h2>
		<div class="home">
			<h3 class="download-texto">Olhos Desafiantes 1.1V | <a href="Olhos Desafiantes.zip" download>Download</a> (Somente para Sistemas Operacionais Windows. Precisa fazer Cadastro para jogar!)</h3>
				<div id="img4">
				</div>
	</div>
	<footer>
		<h2>©Todos os direitos reservados | P B G C | Telefone (11)2469-6924</h2>
	</footer>

</div>	
</body>
</html>
