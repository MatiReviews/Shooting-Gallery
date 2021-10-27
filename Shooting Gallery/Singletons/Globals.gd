extends Node

var score : = 0

var scores = []

const config_path = "user://settings.cfg"
var config

var xd :float = 0.0

func _ready():
	config = ConfigFile.new()
	if config.load(config_path) != OK:
		print("Error loading config")
		config.set_value("graphics", "fullscreen", false)
		config.set_value("stats", "scores", scores)
		config.save(config_path)
	else:
		print("Config Loaded")
		set_fullscreen(config.get_value("graphics","fullscreen", []))
		scores = config.get_value("stats", "scores", [])
		_set_Master_Volume(config.get_value("Audio", "Master", []))

func _add_Scores(new_score: int):
	scores.append(new_score)
	config.set_value("stats", "scores", scores)
	config.save(config_path)

func _get_Score_List() -> Array:
	return scores

func set_fullscreen(enabled: bool):
	OS.window_fullscreen = enabled
	config.set_value("graphics","fullscreen", enabled)
	config.save(config_path)

func _set_Master_Volume(volume : float):
	AudioServer.set_bus_volume_db(0, linear2db(volume/100))
	config.set_value("Audio", "Master", volume)
	config.save(config_path)
	
func _set_Sfx_Volume(volume : float):
	AudioServer.set_bus_volume_db(2, linear2db(volume/100))
	config.set_value("Audio", "Sfx", volume)
	config.save(config_path)
