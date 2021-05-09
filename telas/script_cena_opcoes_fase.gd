extends Node2D

func _ready():
	$Node2D.visible = false

func _process(_delta):
	if(Input.is_action_just_pressed("ui_opcoes")):
		get_tree().paused = not get_tree().paused
		$Node2D.visible = get_tree().paused
