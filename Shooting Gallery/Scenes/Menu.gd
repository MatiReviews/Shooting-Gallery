extends Control

func _ready():
	$Label.text = "Scores\n"
	for i in Globals.scores.size():
		$Label.text += "Run %s: %s\n" % [i+1, Globals.scores[i]]
	

func _on_Play_pressed():
	var err = get_tree().change_scene("res://Scenes/Level.tscn")
	if err != OK:
		print("Error al cambiar de escena")
	pass # Replace with function body.

func _on_Options_pressed():
		var err = get_tree().change_scene("res://Scenes/Options.tscn")
		if err != OK:
			print("Error al cambiar de escena")

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
