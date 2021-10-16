extends Sprite

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	
func _exit_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
