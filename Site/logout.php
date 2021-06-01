<?php session_start(); 
session_start();
session_destroy();
header("location: ./index.html"); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Olhos Desafiantes - Logout</title>
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
<style type="text/css">
		
		/*código css referente ao conteúdo da página aqui*/
		#loading{
				margin-top: 10%;
				width: 90%;
				margin-left: auto;
				margin-right: auto;
			}
		h1{
				z-index: 1;
				position: relative;
				text-align: center;
				font-size: 2.5em;
			}
		p{
				text-align: center;
				margin-top: -10%;

			}
		img{
				width: 254px; 
				z-index: 0;	
			}
		@media screen and (min-width: 960px){
		#loading{
			margin-top: 0;
			width: 90%;
			margin-left: auto;
			margin-right: auto;
		}
		img{
			width: 256px;  
			z-index: 0;
		}
		p{
			text-align: center;
			margin-top: -10%;
		}		
		h1{
			margin-top: 5em;
			text-align: center;
			z-index: 1;
			position: relative;
			font-size: 3em;
			}

		}
		@media screen and (min-width: 1024px){
			p{
			margin-top: -7%;
			}	
		}
		@media screen and (min-width: 1440px){
			p{
			margin-top: -5%;
			}	
		}
		@media screen and (min-width: 2000px){
			p{
			margin-top: -1%;
			}	
		}
	</style>

</head>
<body id="index">
	<div id="loading">
	<h1>Redirecionando...</h1>
	<p><img src="imgs/Loading.gif"></p>
	
	

	<script>
		//↓temporiza o redirecionador da janela
		//window.setTimeout("location.href='Pagina_Principal.php'",1000)
		//↓redireciona a janela
		javascript:window.location='Pagina_Principal.php';
		
	</script>

</div>
</body>
</html>