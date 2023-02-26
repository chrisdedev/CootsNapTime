extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var random = RandomNumberGenerator.new()

var tutorial = true

signal add_point

var volume = 0

var point = 0 setget set_points
var room_spawners=[]
var nap_spawners=[]
var used_nap_spawner=[]
var last_room=-1
var picked_object = null
var player = null
var nap_coots = null

var nap_timer
# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()
	pass # Replace with function body.

func add_nap_spawner(node):
	nap_spawners.append(node)
	used_nap_spawner.append(false)

func add_spawner(node):
	for e in room_spawners:
		if e[0] == node.room_name:
			e[1].append(node)
			return
	room_spawners.append([node.room_name,[node]])

func spawn_all():
	for e in room_spawners:
		for s in e[1]:
			s.spawn()
	for e in nap_spawners:
		e.spawn()

func spawn_nap():
	var num = random.randi_range(0,nap_spawners.size()-1)
	for i in range(0,nap_spawners.size()-1):
		var index = (num+i) %nap_spawners.size()
		if not used_nap_spawner[index]:
			nap_spawners[index].spawn()
			used_nap_spawner[index]=true
			return

func clear_used(nap):
	for i in range(0,used_nap_spawner.size()-1):
		if nap_spawners[i] == nap:
			used_nap_spawner[i]=false
			return

func spawn():
	var num = random.randi_range(0,room_spawners.size()-1)
	if num == last_room:
		last_room = (last_room+1) % room_spawners.size()
	else:
		last_room = num
	num = random.randi_range(0,room_spawners[last_room][1].size()-1)
	room_spawners[last_room][1][num].spawn()

func add_point():
	emit_signal("add_point")
	
func set_points(val):
	point = val
	add_point()
