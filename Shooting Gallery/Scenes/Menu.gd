extends Control

func _ready():
#	$Label.text = "Scores: " + str(Globals.score)
#	for score in Globals.score:
	$Label.text += ": " + str(Globals.score)
		
	#en que iteracion
#	for i in Globals.scores.size():
#		#$Label.text += str(i+1) + ": " + str(Globals.score[i])
#		$Label.text += "Run %S\n" % [i+1, Globals.score[i]]


func _on_Play_pressed():
	var err = get_tree().change_scene("res://Scenes/Level.tscn")
	if err != OK:
		print("Error al cambiar de escena")
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
