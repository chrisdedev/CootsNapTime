extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Globals.connect("add_point",self,"update_points")
	
func update_points():
	$RichTextLabel.text=str(Globals.point)


func start():
	$ProgressWheel.get_node("Timer").start(1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
