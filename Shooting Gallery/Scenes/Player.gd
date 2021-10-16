extends Position2D

onready var player_Reset_Healh : int = 100
onready var health = player_Reset_Healh
onready var Anims = $AnimationPlayer

signal hit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_Damage_Sprite():
	if health == 100 and health > 85:
		Anims.play("100")
	elif health <= 85 and health > 75:
		Anims.play("75")
	elif health <= 75 and health > 50:
		Anims.play("50")
	elif health <= 50 and health > 25:
		Anims.play("25")
	elif health <= 25:
		Anims.play("m25")

func _getHealth():
	return health
	
func _resetHealth():
	health = player_Reset_Healh
	
func _setDamage(damage):
	health -= damage
