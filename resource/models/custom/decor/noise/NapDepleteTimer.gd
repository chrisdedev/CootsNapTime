extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_NapDepleteTimer_timeout():
	if Globals.nap_timer != null:
		Globals.nap_timer.paused=true
		var t_left = Globals.nap_timer.time_left
		Globals.nap_timer.start(max(t_left-2,0))
		Globals.nap_timer.paused=false
