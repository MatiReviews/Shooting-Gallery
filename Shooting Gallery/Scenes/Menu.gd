extends Control

func _ready():	
	$Label.text = "Scores\n"
	
	#en que iteracion
#	for score in Globals.scores:
#		$Label.text += str(score) + "\n"
	
	for i in Globals.scores.size():
		$Label.text += str(i+1) + ": " + str(Globals.scores[i]) + "\n"
#		$Label.text += "Run %S\n" % [i+1, Globals.score[i]]
	pass

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
