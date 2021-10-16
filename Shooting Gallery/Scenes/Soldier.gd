extends Position2D

onready var anims = $AnimationPlayer
onready var appear_timer = $appear_timer

var tempBool : bool = false

signal killed()
signal fired()

var press = 0
var health = 2
var damage_Dealt = 2

var minTime = 2
var maxTime = 4

#export(Array, Vector2) var posiciones = []

#var positions = [Vector2(100,200), Vector2(200,100), Vector2(250,300)]
#var current_position = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_appear_timer_timeout():
	anims.play("appear")
	pass # Replace with function body.

func _reset_timer():
	appear_timer.wait_time = rand_range(minTime,maxTime)
	appear_timer.start()

func _on_collider_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("shoot"):
		if getTemp() == true:
			press += 1
			_setTemp(false)
			if press >= health:
				anims.play("die")
				emit_signal("killed")
				press = 0
	pass # Replace with function body.

func shoot():
	_shootSound()
	emit_signal("fired")

func _shootSound():
	get_node("collider/shotSound").play()

func getTemp():
	return tempBool
	
func _setTemp(activate):
	tempBool = activate

func _getHealth():
	return health

func _getDamage():
	return damage_Dealt
