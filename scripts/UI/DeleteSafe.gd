extends Label


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ALT) && Input.is_key_pressed(KEY_DELETE):
		DeleteFunction()

func DeleteFunction() -> void:
	global.config.set_value("Level", "last_level", null)
	global.config.set_value("Settings", "explodeVolume", null)
	global.config.set_value("Settings", "musicVolume", null)
	global.config.set_value("Settings", "showTrail", null)
	global.config.set_value("Settings", "showFps", null)
	global.config.save("user://save.cfg")
	$".".text = "Please Restart to fully reset!"
	$"../DeleteInfoMobile".text = "Please Restart to fully reset!"
	yield(get_tree().create_timer(1.0),"timeout")
	$".".text = "To Delete your Savefile press \"ALT+DEL\"" #PC Version
	$"../DeleteInfoMobile".text = "To Delete your Savefile press here!" #Mobile Version
