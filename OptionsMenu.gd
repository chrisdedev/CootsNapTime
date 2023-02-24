extends Control

func _ready():
	$AudioSlider.value=Globals.volume
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

func _on_AudioSlider_value_changed(value):
	Globals.volume=value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Globals.volume)



func _on_BackButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
