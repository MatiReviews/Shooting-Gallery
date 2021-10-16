extends Position2D

onready var Anims = $AnimationPlayer
onready var appear_timer = $Timer

var minTime = 6
var maxTime = 15

var x = 0
var y = 0

signal collected()

export(Array, Vector2) var posiciones = []

func _ready():
	appear_timer.wait_time = rand_range(minTime,maxTime)
	appear_timer.start()
	randomize()

func _process(delta):
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("shoot"):
		Anims.play("clicked")
		emit_signal("collected")

func _on_Timer_timeout():
	if not posiciones.empty():
		position = posiciones[randi() % posiciones.size()]
	Anims.play("start")
	pass # Replace with function body.
	
func _reset_timer():
	appear_timer.wait_time = rand_range(minTime,maxTime)
	appear_timer.start()
	print(appear_timer.wait_time)
