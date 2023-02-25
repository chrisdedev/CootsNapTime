extends Control

func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/CenterContainer/AudioSlider.value=Globals.volume
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	$CenterContainer/VBoxContainer/HBoxContainer3/TutorialCheckBox.pressed=Globals.tutorial

func _on_AudioSlider_value_changed(value):
	Globals.volume=value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Globals.volume)

func _on_BackButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_FullscreenCheckBox_pressed():
	if $CenterContainer/VBoxContainer/HBoxContainer2/FullscreenCheckBox.pressed:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false
		OS.window_size = Vector2(1280,720)


func _on_TutorialCheckBox_pressed():
	Globals.tutorial = $CenterContainer/VBoxContainer/HBoxContainer3/TutorialCheckBox.pressed
