extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CheckButton.pressed = OS.window_fullscreen
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	Globals._set_Master_Volume(value)
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	Globals.set_fullscreen(button_pressed)
	pass # Replace with function body.


func _on_Back_pressed():
	var err = get_tree().change_scene("res://Scenes/Menu.tscn")
	if err != OK:
		print("Error al cambiar de escena")
	pass # Replace with function body.
