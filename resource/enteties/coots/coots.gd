extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.nap_coots=self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func getLookAt(target, up):
	var forward = (global_transform.origin - target).Normalized();
	var right = up.Cross(forward).Normalized();
	var newUp = forward.Cross(right);
	var rotation = Basis(right, newUp, forward);
	return Transform(rotation, global_transform.origin);


func _physics_process(delta):
	if Globals.player != null:
		#var c = translation.cross(get_parent().player.translation)
		look_at(Globals.player.translation,Vector3(0,1,0))
		#rotation_degrees = (get_global_transform_interpolated()-player.get_global_transform_interpolated())


func _on_Timer_timeout():
	Globals.nap_coots=null
	queue_free()
