extends Node

var score : = 0

#var scores = []

const config_path = "user://settings.cfg"
var config

func _ready():
	var config = ConfigFile.new()
	if config.load(config_path) != OK:
		print("Error loading config")
		config.set_value("graphics", "fullscreen", false)
		#config.set_value("stats", "scores", scores)
		config.save(config_path)
	else:
		print("Config Loaded")
