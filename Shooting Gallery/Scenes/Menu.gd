extends Control

func _ready():
	$CheckButton.pressed = OS.window_fullscreen
	
	$Label.text = "Scores\n"
	for i in Globals.scores.size():
		$Label.text += "Run %s: %s\n" % [i+1, Globals.scores[i]]
	


func _on_Play_pressed():
	var err = get_tree().change_scene("res://Scenes/Level.tscn")
	if err != OK:
		print("Error al cambiar de escena")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_CheckButton_pressed():
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	Globals.set_fullscreen(button_pressed)
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	Globals._set_Master_Volume(value)
	pass # Replace with function body.
