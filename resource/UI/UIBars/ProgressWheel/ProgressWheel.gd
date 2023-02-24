extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Color) var fg_color = Color.darkgreen
export(Color) var bg_sub_color = Color.red
export(Color) var bg_add_color = Color.blue
export(Color) var fg_sub_color = Color.orangered
export(Color) var fg_add_color = Color.green
export(Color) var fg_pulse_color = Color.darkred
export(bool) var fg_flash_change = true
export(bool) var bg_trail = true
export(bool) var fg_change_color = true
export(bool) var fg_pulse = false

const FLASH_RATE = 0.2
const N_FLASHES = 1
signal pulse()

onready var fg_bar = $FGProgress
onready var bg_bar = $BGProgress
onready var update_tween = $UpdateTween
onready var pulse_tween = $PulseTween
onready var flash_tween = $FlashTween
#
#export(Color) var health_color = Color.green
export(Color) var caution_color = Color.yellow
export(Color) var danger_color = Color.red
#export(Color) var pulse_color = Color.darkred
#export(Color) var flash_color = Color.orangered
#export(Color) var add_color = Color.darkmagenta
export(float, 0, 1, 0.05) var caution_zone = 0.5
export(float, 0, 1, 0.05) var danger_zone = 0.2
var add_operation = false
var finish_color
var last_val = 100




func _on_value_updated(value, amount):
	if bg_trail:
		if amount < 0:
			add_operation = false
			fg_bar.value = value
			bg_bar.tint_progress=bg_sub_color
			update_tween.interpolate_property(bg_bar, "value", bg_bar.value, value, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
			update_tween.start()
		elif amount > 0:
			add_operation = true
			bg_bar.tint_progress=bg_add_color
			bg_bar.value = value
			update_tween.interpolate_property(fg_bar, "value", fg_bar.value, value, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
			update_tween.start()
	if fg_change_color:
		_assign_color(value,fg_bar)
	if amount < 0 and fg_flash_change:
		_flash_damage()
	
func _assign_color(value,bar):
	if value <= 0:
		pulse_tween.set_active(false)
	elif value < fg_bar.max_value * danger_zone:
		if fg_pulse:
			if !pulse_tween.is_active():
				pulse_tween.interpolate_property(fg_bar,"tint_progress",fg_pulse_color,danger_color,1.2,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
				pulse_tween.interpolate_callback(self,0.0,"emit_signal","pulse")
				pulse_tween.start()
		else:
			finish_color = danger_color
	else:
		pulse_tween.set_active(false)
		if value < fg_bar.max_value * caution_zone:
			finish_color = caution_color
		else:
			finish_color = fg_color
	if fg_flash_change and !add_operation:
		fg_bar.tint_progress=fg_sub_color
	else:
		fg_bar.tint_progress=finish_color

func _flash_damage():
	var color
	var time
	for i in range(N_FLASHES * 2):
		color = finish_color if i % 2 == 1 else fg_sub_color
		time = FLASH_RATE * i + FLASH_RATE
		flash_tween.interpolate_callback(fg_bar,time,"set","tint_progress",color)
	flash_tween.start()

func _on_max_health_updated(max_health):
	fg_bar.max_value = max_health
	bg_bar.max_value = max_health

func subtract(value):
	_on_value_updated(min(fg_bar.value,bg_bar.value)-value,-value)
	
func add(value):
	_on_value_updated(max(fg_bar.value,bg_bar.value)+value,value)


func _on_Timer_timeout():
	var cur_val = int(Globals.nap_timer.time_left)
	if cur_val < last_val:
		subtract(last_val-cur_val)
	elif cur_val > last_val:
		add(cur_val-last_val)
	last_val = cur_val
