extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NapDepleteTimer_timeout():
	get_parent().nap_timer.paused=true
	var t_left = get_parent().nap_timer.time_left
	get_parent().nap_timer.start(max(t_left-2,0))
	get_parent().nap_timer.paused=false
