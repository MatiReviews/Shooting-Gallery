extends Position2D

signal finish()

onready var temp : bool = false
onready var reloading : bool = false

const fixedAmmo = 7
onready var ammo : int = fixedAmmo

const empty = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_pressed("reload")):
		reloading = true
		_resetAmmo()

func _shoot():
	if ammo > 1:
		get_node("AnimationPlayer").play("shootColt")
		ammo-=1
	elif ammo <= 1:
		get_node("AnimationPlayer").play("lastBullet")
	temp = true

func _shootSound():
	get_node("Area2D/ShotSound").play()
	
func _reloadSound1():
	get_node("Area2D/ReloadSound1").play()
	
func _reloadSound2():
	get_node("Area2D/ReloadSound2").play()
	
func _reloadSound3():
	get_node("Area2D/ReloadSound3").play()

func _finishShooting():
	emit_signal("finish")
	temp = false

func _getFinishShooting():
	return temp

func _getAmmo():
	return ammo

func _resetAmmo():
	get_node("AnimationPlayer").play("reload")
	ammo = 7

func _getEmpty():
	return empty

func _printAmmo():
	print(ammo-1)

func _isReloading():
	return reloading

func _setReloading(reload):
	reloading = reload
