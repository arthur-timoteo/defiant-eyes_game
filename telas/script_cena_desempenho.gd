extends Node2D

func _ready():
	buscar_dados_jogador_no_ranking()
	buscar_lista_desempenho()

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	for i in range(json.result.size()):
		$Node2D/ItemList.add_item(json.result[i].numero_fase + " - " + json.result[i].tempo_gasto + " - " + json.result[i].pontos + " - " + json.result[i].quantidade_vidas + " - " + json.result[i].inimigos_matados + " - " + json.result[i].data)
		

func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	
	for i in range(json.result.size()):
		if(json.result[i].id == ScriptGlobal.IdJogador):
			$Node2D/RichTextLabel.text = json.result[i].nome + " confira seu desempenho no jogo"
			$Node2D/RichTextLabel2.text = "Pontos: " + str(json.result[i].pontos)
			$Node2D/RichTextLabel3.text = "Posição no ranking: " + str(i + 1)
	
func buscar_lista_desempenho():
	var url_requisicao = ScriptGlobal.BdURL + "/servico/desempenho_jogador.php?"
	var dados_envio = "id="+str(ScriptGlobal.IdJogador)
	var cabecalho   = ["Content-Type: application/json"]
	$Node2D/HTTPRequest.request(url_requisicao + dados_envio, cabecalho, false, HTTPClient.METHOD_GET)
	
func buscar_dados_jogador_no_ranking():
	var url_requisicao = ScriptGlobal.BdURL + "/servico/ranking.php"
	var cabecalho   = ["Content-Type: application/json"]
	$Node2D/HTTPRequest2.request(url_requisicao, cabecalho, false, HTTPClient.METHOD_GET)

func botao_voltar_tela_autenticado():
	get_tree().change_scene("res://telas/cena_autenticado.tscn")
