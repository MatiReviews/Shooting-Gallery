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

var reset_Score_Points = 50
var player_hp = 100

var easy_Score = 9
var hard_Score = 13
var car_Score = 18

var rifle_particles = preload("res://Scenes/Particles/Rifle_Particle.tscn")

var ri_Particles_Pos = Vector2(40.0,60.0)

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
	player._reset_Health()
	player._set_Damage_Sprite()
	
	if player._player_Dead():
		_gameover()
	
	_Show_Ammo()
	health_txt.text = player._Show_Player_health()
	score_txt.text = player._Show_Player_Score()
	pass

func _on_Soldier_fired():
	player._set_Damage(soldier_1._getDamage())

func _on_Soldier_Shotgun_fired():
	player._set_Damage(soldier_Shotgun._getDamage())

func _on_Car_fired():
	player._set_Damage(car._getDamage())


func _on_Soldier_killed():
	player._set_Score(easy_Score)
	Globals.score = player._get_Score()

func _on_Soldier_Shotgun_killed():
	player._set_Score(hard_Score) 
	Globals.score = player._get_Score()

func _on_Car_killed():
	player._set_Score(car_Score)  
	Globals.score = player._get_Score()


func _on_Timer_timeout():
	anims_Explo.play("Explosion")

func _Show_Ammo():
	ammo_txt.text = "Ammo " + str(colt._getAmmo())

func _gameover():
	anims_fade.play("gameover")
	_to_menu()

func _to_menu():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _player_Shoot():
	colt._shoot()
	pass

func _input(event):
	#if (event.is_pressed() and event.button_index == BUTTON_LEFT):
	if event.is_action_pressed("shoot"):
		if colt._getFinishShooting() != true and colt._getAmmo() != colt._getEmpty() and colt._isReloading() == false:
			#colt._printAmmo()
			_spawn_rifle_particles()
			#print("disparé: " + str(disp))
			soldier_1._setTemp(true)
			car._setTemp(true)
			soldier_Shotgun._setTemp(true)
			soldier_Shotgun._printInfo("1")
			
			soldier_Shotgun2._setTemp(true)
			soldier_Shotgun2._printInfo("2")
			
			_player_Shoot()

func _collectedPU():
	player._reset_Health()

func _spawn_rifle_particles():
	var new_particles = rifle_particles.instance()
	add_child(new_particles)
	new_particles.emitting = true
	new_particles.global_position = get_global_mouse_position() + ri_Particles_Pos
	pass
