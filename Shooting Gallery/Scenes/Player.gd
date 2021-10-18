extends Position2D

onready var reset_Healh : int = 100
onready var health = reset_Healh
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

func _get_Score():
	return score

func _set_Damage(damage):
	health -= damage
	
func _set_Score(_score):
	score += _score

func _reset_Health():
	if _get_Score() >= _reset_Player_Points():
		health = reset_Healh
		_add_Score()

func _reset_Player_Points():
	return reset_Score_Points

func _add_Score():
	temp += reset_Score_Points

func _Show_Player_Score():
	return "Score " + str(_get_Score())

func _Show_Player_health():
	return "Health " + str(_get_Health())

func _player_Dead():
	if _get_Health() <= 0:
		return true
