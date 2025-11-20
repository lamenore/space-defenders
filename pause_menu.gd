extends CanvasLayer

@onready var resumebutton: Button = $menuholder/resumebutton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_resumebutton_pressed() -> void:
	get_tree().paused=false
	visible = false


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		resumebutton.grab_focus()

func _on_quitbutton_pressed() -> void:
	get_tree().quit() # Replace with function body.
