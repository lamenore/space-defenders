extends Control


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_selectbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://phase1.tscn")


func _on_quitbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://inicialscreen/inicial_screen.tscn")
