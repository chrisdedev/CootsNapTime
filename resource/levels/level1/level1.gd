extends Spatial

var player = null

onready var nap_timer = $NapTimer

var wake_up
# Called when the node enters the scene tree for the first time.
func _ready():
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Globals.volume)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	Globals.picked_object=null
	Globals.nap_timer = $NapTimer

func _on_Timer_timeout():
	Globals.spawn()
	$Player.start()

func _on_DropZone_area_entered(area):
	Globals.point+=1
	Globals.picked_object=null
	area.get_parent().queue_free()
	Globals.spawn_nap()
	$Timer.start(1)

func _on_NapTimer_timeout():
	print("Nap Time Over: ",Globals.point)
