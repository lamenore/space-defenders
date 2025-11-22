extends CanvasLayer

func _ready() -> void:
	visible = false
	
func _process(_delta: float) -> void:
	pass

func _on_resumebutton_pressed() -> void:
	get_tree().paused=false
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

func _on_quitbutton_pressed() -> void:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://inicialscreen/inicial_screen.tscn")

func _on_settingsbutton_pressed() -> void:
	get_tree().change_scene_to_file #mudar para a cena das configurações
