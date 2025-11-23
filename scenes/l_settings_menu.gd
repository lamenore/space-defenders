extends CanvasLayer

signal settings_closing;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var value: int = $VBoxContainer/HBoxContainer/MusicVolumeHSlider/Slider.value
	$VBoxContainer/HBoxContainer/MusicVolumeNumLabel.text = str(value)
	value = $VBoxContainer/HBoxContainer2/SfxVolumeHSlider/Slider.value
	$VBoxContainer/HBoxContainer2/SfxVolumeNumLabel.text = str(value)

func _on_music_slider_value_changed(value: int) -> void:
	$VBoxContainer/HBoxContainer/MusicVolumeNumLabel.text = str(value)


func _on_sfx_slider_value_changed(value: int) -> void:
	$VBoxContainer/HBoxContainer2/SfxVolumeNumLabel.text = str(value)

func _on_quit_pressed() -> void:
	visible = false
	settings_closing.emit()

func _on_settingsbutton_pressed() -> void:
	visible = true
