<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Olhos Desafiantes - Ranking</title>
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
	<style>
	<?php  
	if (isset($_SESSION["login"]) == TRUE ){  
				$login = $_SESSION["login"]; 
			    if($login === ""){
					echo "table { 
							border:5px solid #00F;
							margin-bottom: 2%;
							
						}
						@media screen and (min-width: 700px){
							table {
								width: 95%;
								margin-left: 2.5%; 
								border:5px solid #00F;
								margin-bottom: 2%;
							}
						}";
				}else{

				echo "table {
						width: 100%;
						border:5px solid #00F;
						margin-bottom: 2%;
					}
					@media screen and (min-width: 700px){
						table {
							width: 45%;
							margin-right: 2%;
							margin-left: 2%;
							border:5px solid #00F;
							margin-bottom: 2%;
							float:left;
						}
					}"
					; 
				}
			}else{
				echo "table { 
							width: 100%;
							border:5px solid #00F;
							margin-bottom: 2%;
							
						}
						@media screen and (min-width: 700px){
							table {
								width: 95%;
								margin-left: 2.5%; 
							}
						}";
			}
	?>		
	
	.coluna{
		background-color: #00F;
		color: #FFD700;
	}
	td{
		border:5px solid #00F;
	}


	</style>
</head>
<body>
<div id="Corpo">
	<div id="topo">
		<?php
		if (isset($_SESSION["login"]) == TRUE ){  
				$login = $_SESSION["login"]; 
			    if($login === ""){
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
					$login = $_SESSION["login"];
			    	if($login === "Entrar"){
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
				<li class="lista-menu"><a href="Home.php"  class="texto-menu"><span>
				Home</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Download.php" class="texto-menu"><span>Download</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="InfoJogo.php" class="texto-menu"><span>Informações do jogo</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Ranking.php" class="texto-menu"><span>Ranking</span></a></li>
				<li class="lista-menu"><h2 class="espaco-menu">|</h2></li>
				<li class="lista-menu"><a href="Sobre.php" class="texto-menu"><span>Sobre</span></a></li>
			</ul>
	</nav>
	<div id="conteudo">
		<h2 class="titulo-pagina">Ranking</h2>
		<table>
   		<tr>
   			<td class="coluna"><h2>Pos.</h2></td>
   			<td class="coluna"><h2>Usuário</h2></td>
   			<td class="coluna"><h2>Pontuação</h2></td>
   		</tr>
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
			$posicao = 0;
			$sql1 = "SELECT U.nome, P.pontos_maximos FROM tbl_pontos_maximos P LEFT JOIN tbl_usuario U ON U.id_usuario = P.id_usuario ORDER BY P.pontos_maximos DESC limit 10;";
				if ($conn->query($sql1) == TRUE) {
					$result = $conn->query($sql1);
					if ($result->num_rows > 0) {
						while($row = $result->fetch_assoc()){
							$nome	= $row["nome"];
							$pontos_maximos = $row["pontos_maximos"];
							$posicao += 1;
							echo "<tr>
										<td><h2>".$posicao."</h2></td>
							   			<td><h2>".$nome."</h2></td>
							   			<td><h2>".$pontos_maximos."</h2></td>
							   		</tr>";

						}
					}
				}
						
			?>
		</table>
		<table>
		<?php
		if (isset($_SESSION["login"]) == TRUE){
			 echo "
   					<tr>
   						<td class='coluna'><h2>Usuário</h2></td>
   						<td class='coluna'><h2>Pontuação</h2></td>
   					</tr>";	

   			$sql2 = "SELECT U.nome, P.pontos_maximos FROM tbl_pontos_maximos P LEFT JOIN tbl_usuario U ON U.id_usuario = P.id_usuario where nome = '".$_SESSION["nome"]."' ORDER BY P.pontos_maximos ";
				
			if ($conn->query($sql2) == TRUE) {
				$result = $conn->query($sql2);
				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()){
						$nome	=$row["nome"];
						$pontos_maximos = $row["pontos_maximos"];
						echo "<tr>
							<td><h2>".$nome."</h2></td>
							<td><h2>".$pontos_maximos."</h2></td>
							</tr>";
					}
				}else{
					echo "<tr>
							<td><h2>".$_SESSION["nome"]."</h2></td>
							<td><h2>0</h2></td>
							</tr>";
				}
			}

		}	
		mysqli_close($conn);	
   		?>
   		</table>
	</div>
	<footer>
		<h2>©Todos os direitos reservados | P B G C | Telefone (11)2469-6924</h2>
	</footer>
</div>	
</body>
</html>