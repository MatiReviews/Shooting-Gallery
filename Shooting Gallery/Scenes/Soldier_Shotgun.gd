extends Position2D

onready var anims_Shotgun = $Anims_Shotgun
onready var appear_timer = $appear_timer2

var tempBool : bool = false

signal killed()
signal fired()

var press = 0
var shotgun_Health : int = 0
var damage_Dealt = 5

export(Array, Vector2) var posiciones = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	shotgun_Health = rand_range(3,5)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_appear_timer2_timeout():
	if not posiciones.empty():
		position = posiciones[randi() % posiciones.size()]
	anims_Shotgun.play("appear")
	pass # Replace with function body.

func _reset_timer():
	appear_timer.wait_time = rand_range(1,5)
	shotgun_Health = rand_range(3,5)
	appear_timer.start()
	
	if press < 3:
		press = 0

func _on_collider_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("shoot"):
		if getTemp() == true:
			press += 1
			_setTemp(false)
			if press >= shotgun_Health:
				anims_Shotgun.play("die")
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
	return shotgun_Health
	
func _getHit():
	return press + 1

func _getDamage():
	return damage_Dealt

func _printInfo(letra):
		print("shotgun " + str(letra) + " total health " + str(_getHealth()))
		print("shotgun " + str(letra) + " got hit " + str(_getHit()))
