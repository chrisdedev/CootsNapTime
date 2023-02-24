extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum {
	SMART_PHONE, TV, RADIO, LAPTOP
}

export(int, "SMART_PHONE","TV","RADIO","LAPTOP") var spawn_type
export var room_name = ""

var tv = load("res://resource/models/custom/furnature/TV.tscn")
var smart_phone = load("res://resource/models/custom/decor/noise/Smartphone.tscn")
var radio = load("res://resource/models/custom/decor/noise/Radio.tscn")
var laptop = load("res://resource/models/custom/decor/noise/Laptop.tscn")

func _ready():
	pass # Replace with function body.
	Globals.add_spawner(self)

func spawn():
	match(spawn_type):
		SMART_PHONE:
			add_child(smart_phone.instance())
		RADIO:
			add_child(radio.instance())
		TV:
			add_child(tv.instance())
		LAPTOP:
			add_child(laptop.instance())
