extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(3), "timeout")
	salvar_andamento_jogador()
	#assert(get_tree().change_scene(ScriptGlobal.caminhoDirecionarDepoisDeSalvarAndamento) == OK)
	
func salvar_andamento_jogador():
	var url_requisicao = ScriptGlobal.BdURL + "/servico/salvar_andamento.php"
	var dados_envio = "numero_fase=" + str(ScriptGlobal.faseAtual) + "&tempo_gasto="+ str(ScriptGlobal.tempoGasto) + "&pontos=" + str(ScriptGlobal.QuantidadePontos) + "&quantidade_vidas=" + str(ScriptGlobal.QuantidadeVida) + "&inimigos_matados=" + str(ScriptGlobal.inimigosMatados) + "&id_usuario=" + str(ScriptGlobal.IdJogador)
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] 
	$HTTPRequest.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	if (json.result.size()>0):
		var resultado = json.result["msg"]
		
		if(resultado == "ok"):
			if(ScriptGlobal.faseAtual < 3):
				ScriptGlobal.faseAtual += 1
			assert(get_tree().change_scene(ScriptGlobal.caminhoDirecionarDepoisDeSalvarAndamento) == OK)
		else:
			$Control3/AnimationPlayer.queue_free()
			$AcceptDialog.dialog_text = "Houve um erro ao tentar salvar seu desempenho nesta fase!"
			$AcceptDialog.show()
	else:
		$Control3/AnimationPlayer.queue_free()
		$AcceptDialog.dialog_text = "Houve um erro ao tentar se comunicar com o servidor!"
		$AcceptDialog.show()

func _on_AcceptDialog_confirmed():
	assert(get_tree().change_scene(ScriptGlobal.caminhoDirecionarDepoisDeSalvarAndamento) == OK)
