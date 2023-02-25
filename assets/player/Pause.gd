extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ContinueButton_pressed():
	self.hide()
	get_tree().paused = false



func _on_RestartButton_pressed():
	Globals.room_spawners=[]
	Globals.nap_spawners=[]
	Globals.picked_object=null
	Globals.point=0
	Globals.player=null
	get_tree().paused = false
	get_tree().change_scene("res://resource/levels/level1/level1.tscn")


func _on_MenuButton_pressed():
	Globals.room_spawners=[]
	Globals.nap_spawners=[]
	Globals.picked_object=null
	Globals.point=0
	Globals.player=null
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")
