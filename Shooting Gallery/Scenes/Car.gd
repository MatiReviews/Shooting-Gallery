extends Position2D

onready var anims_Car = $AnimationCar
onready var appear_timer = $Car_Timer

var tempBool : bool = false

signal killed()
signal fired()

var press = 0
var car_Health : int = 0
var damage_Dealt = 1

func _ready():
	randomize()
	car_Health = rand_range(6,8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Car_Timer_timeout():
	anims_Car.play("appear")
	pass # Replace with function body.
	
func _reset_timer():
	appear_timer.wait_time = rand_range(3,6)
	car_Health = rand_range(6,8)
	appear_timer.start()
	if press < car_Health:
		press = 0

func _on_collider_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("shoot"):
		if getTemp() == true:
			press += 1
			print("Car got hit " + str(press))
			print("Car Total Health " + str(car_Health))
			_setTemp(false)
			if press >= car_Health:
				anims_Car.play("die")
				emit_signal("killed")
				press = 0

func shoot():
	_shootSound()
	emit_signal("fired")

func _shootSound():
	get_node("collider/shotSound").play()

func getTemp():
	return tempBool
	
func _setTemp(activate):
	tempBool = activate

func _getDamage():
	return damage_Dealt
