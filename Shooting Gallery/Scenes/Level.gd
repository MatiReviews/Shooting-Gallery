extends Node2D

onready var anims_Explo = $Anim_Explosiones
onready var health_txt = $UI/Health
onready var score_txt = $UI/Score
onready var ammo_txt = $UI/Ammo
onready var anims_fade = $UI/Anim_Fade
onready var colt = $Crosshair/Colt
onready var soldier_1 = $Soldier
onready var soldier_Shotgun = $Soldier_Shotgun
onready var soldier_Shotgun2 = $Soldier_Shotgun2
onready var car = $Car
onready var player = $UI/Player
onready var powerUp = $PU_Health

var score : int = 0
var reset_Score_Points = 50
var player_hp = 100

var easy_Score = 9
var hard_Score = 13
var car_Score = 18

var temp = reset_Score_Points

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("enemies", "connect", "fired", self, "_on_Soldier_fired")
	get_tree().call_group("enemies", "connect", "killed", self, "_on_Soldier_killed")
	
	get_tree().call_group("enemiesH", "connect", "fired", self, "_on_Soldier_Shotgun_fired")
	get_tree().call_group("enemiesH", "connect", "killed", self, "_on_Soldier_Shotgun_killed")
	
	get_tree().call_group("enemyCar", "connect", "fired", self, "_on_Car_fired")
	get_tree().call_group("enemyCar", "connect", "killed", self, "_on_Car_killed")
	
	get_tree().call_group("PowerUp", "connect", "collected", self, "_collectedPU")

func _process(delta):
	_reset_health()
	player._set_Damage_Sprite()
	_playerDead()
	_Show_Player_Ammo()
	_Show_Player_health()
	_Show_Player_Score()	
	pass

func _on_Soldier_fired():
	player._setDamage(soldier_1._getDamage())
	#_Show_Player_health()

func _on_Soldier_killed():
	score += easy_Score
	Globals.score = score
	#_Show_Player_Score()

func _on_Soldier_Shotgun_fired():
	player._setDamage(soldier_Shotgun._getDamage())
	#_Show_Player_health()

func _on_Soldier_Shotgun_killed():
	score += hard_Score
	#_Show_Player_Score()

func _on_Car_fired():
	player._setDamage(car._getDamage())
	#_Show_Player_health()

func _on_Car_killed():
	score += car_Score
	#_Show_Player_Score()

func _on_Timer_timeout():
	anims_Explo.play("Explosion")

func _Show_Player_health():
	health_txt.text = "Vida: " + str(player._getHealth())

func _Show_Player_Score():
	score_txt.text = "Score " + str(score)

func _Show_Player_Ammo():
	ammo_txt.text = "Ammo " + str(colt._getAmmo())

func _playerDead():
	if player._getHealth() <= 0:
		_gameover()

func _gameover():
	anims_fade.play("gameover")
	_to_menu()

func _to_menu():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _player_Shoot():
	colt._shoot()
	pass

func _reset_health():
	if score >= temp:
		player._resetHealth()
		temp+=reset_Score_Points

func _input(event):
	#if (event.is_pressed() and event.button_index == BUTTON_LEFT):
	if event.is_action_pressed("shoot"):
		if colt._getFinishShooting() != true and colt._getAmmo() != colt._getEmpty() and colt._isReloading() == false:
			colt._printAmmo()
			#print("disparé: " + str(disp))
			soldier_1._setTemp(true)
			car._setTemp(true)
			soldier_Shotgun._setTemp(true)
			soldier_Shotgun._printInfo("1")
			
			soldier_Shotgun2._setTemp(true)
			soldier_Shotgun2._printInfo("2")
			
			_player_Shoot()

func _collectedPU():
	player._resetHealth()
