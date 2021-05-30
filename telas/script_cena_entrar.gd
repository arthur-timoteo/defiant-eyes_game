extends Node2D

func botao_voltar_para_tela_inicial():
	get_tree().change_scene("res://telas/cena_inicial.tscn")

func botao_entrar():
	var url_requisicao = ScriptGlobal.BdURL + "/servico/verificar_se_cadastrado.php"
	var dados_envio = "email="+$Node2D/LiEdEmail.text
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] 
	$Node2D/HTTPRequest.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	if (json.result.size()>0):
		var url_requisicao = ScriptGlobal.BdURL + "/servico/entrar.php"
		var dados_envio = "email="+$Node2D/LiEdEmail.text+"&senha="+$Node2D/LiEdSenha.text
		var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] 
		$Node2D/HTTPRequest2.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio)
	else:
		$CanvasLayer/Control/AcceptDialog.dialog_text = "Email não cadastrado!";
		$CanvasLayer/Control/AcceptDialog.show();
		
		$Node2D/RichTextLabel.visible = true
		$Node2D/RichTextLabel2.visible = true


func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	if (json.result.size()>0):
		ScriptGlobal.IdJogador = json.result["id"]
		ScriptGlobal.NomeJogador = json.result["nome"]
		ScriptGlobal.faseAtual = int(json.result["fase_atual"])
		var status =  int(json.result["status"])
		
		if(status == 1):
			get_tree().change_scene("res://telas/cena_autenticado.tscn")
		else:
			$CanvasLayer/Control/AcceptDialog.dialog_text = "Essa conta foi banida!";
			$CanvasLayer/Control/AcceptDialog.show();
	else:
		$CanvasLayer/Control/AcceptDialog.dialog_text = "Email ou Senha inválidos!";
		$CanvasLayer/Control/AcceptDialog.show();
