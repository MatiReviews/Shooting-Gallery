extends Position2D

onready var player_Reset_Healh : int = 100
onready var health = player_Reset_Healh
onready var Anims = $AnimationPlayer
var score : int = 0
var reset_Score_Points = 50
var temp = 0

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

func _get_Health():
	return health
	
func _reset_Health():
	health = player_Reset_Healh

func _reset_Player_Points():
	return reset_Score_Points

func _set_Damage(damage):
	health -= damage
	
func _set_Player_Score(_score):
	score += _score

func _get_Player_health():
	return health

func _get_Player_Score():
	return score

func _add_Score():
	temp += reset_Score_Points

func _Show_Player_Score(op):
	return "Score " + str(_get_Player_Score())

func _Show_Player_health(op):
	op.text = "Health " + str(_get_Player_Score())
