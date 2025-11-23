extends SubViewportContainer

@onready var minha_nave = $SubViewport/spaceship

var esta_arrastando = false
var sensibilidade = 0.01

func _ready():
	mouse_filter = Control.MOUSE_FILTER_STOP
	Score.reset_score()
	Score.load_high_score()

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			esta_arrastando = event.pressed
	
	
	if event is InputEventMouseMotion and esta_arrastando:
		minha_nave.rotate_y(event.relative.x * sensibilidade)

func _process(delta):
	if not esta_arrastando:
		minha_nave.rotate_y(0.2 * delta)

func _on_selectbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://phase1.tscn")

func _on_quitbutton_pressed() -> void:
	get_tree().quit()





func _on_howtoplaybutton_pressed() -> void:
	get_tree().change_scene_to_file("res://telacomojogar.tscn")
