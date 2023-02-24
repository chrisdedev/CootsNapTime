extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called when the node enters the scene tree for the first time.
func _ready():
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)

enum {
	NONE, PLAY, OPTIONS, QUIT
}

var state = NONE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_PlayButton_pressed():
	print("P b")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://OptionsMenu.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
