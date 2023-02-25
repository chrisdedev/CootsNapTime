extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.player=null
	Globals.nap_timer=null
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	$CenterContainer/VBoxContainer/Label2.text="Score: "+str(Globals.point)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
