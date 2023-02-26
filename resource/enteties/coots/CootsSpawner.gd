extends Spatial

var coots = load("res://resource/enteties/coots/coots.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Globals.add_nap_spawner(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn():
	print("spawn")
	add_child(coots.instance())

func clear_used():
	print("clear spawn")
	Globals.clear_used(self)
