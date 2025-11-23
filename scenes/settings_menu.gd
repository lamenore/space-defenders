extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_h_slider_value_changed(value: float) -> void:
	$VBoxContainer/HBoxContainer/MusicVolumeNumLabel.text = str(value)


func _on_volume_h_slider_drag_ended(value_changed: bool) -> void:
	pass


func _on_sfx_volume_h_slider_value_changed(value: float) -> void:
	$VBoxContainer/HBoxContainer2/SfxVolumeNumLabel.text = str(value)


func _on_sfx_volume_h_slider_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.


func _on_button_button_up() -> void:
	pass # Replace with function body.
