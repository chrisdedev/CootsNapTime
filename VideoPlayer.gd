extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

func _on_VideoPlayer_finished():
	Globals.tutorial=false
	get_tree().change_scene("res://Tutorial.tscn")
