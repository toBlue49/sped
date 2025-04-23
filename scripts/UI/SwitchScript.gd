extends CheckButton

export var SwitchType = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.config.load("user://save.cfg")
	global.show_trail = global.config.get_value("Settings", "showTrail", true)
	global.show_fps = global.config.get_value("Settings", "showFps", false)
	global.corner_screen_fix = global.config.get_value("Settings", "cornerScreenFix", false)
	global.big_text = global.config.get_value("Settings", "bigText", false)
	if SwitchType == 0:
		self.pressed = global.show_trail
	elif SwitchType == 1:
		self.pressed = global.show_fps
	elif SwitchType == 2:
		self.pressed = global.corner_screen_fix
	elif SwitchType == 3:
		self.pressed = global.big_text

func _on_toggle(button_pressed: bool) -> void: # Show Trail Toggle
	global.show_trail = self.pressed
	global.config.set_value("Settings", "showTrail", global.show_trail)
	print(self.pressed, global.show_trail)
	global.config.save("user://save.cfg")



func _on_FpsCheckButton_toggled(button_pressed: bool) -> void: #Show FPS Toggle
	global.show_fps = $"../FpsCheckButton".pressed
	global.config.set_value("Settings", "showFps", $"../FpsCheckButton".pressed)
	print($"../FpsCheckButton".pressed)
	global.config.save("user://save.cfg")
	
	


func _on_CornerScreenFixToggle_toggled(button_pressed: bool) -> void: #Show CSF Toggle
	global.corner_screen_fix = $"../../CornerScreenFixToggle".pressed
	global.config.set_value("Settings", "cornerScreenFix", $"../../CornerScreenFixToggle".pressed)
	print($"../../CornerScreenFixToggle".pressed)
	global.config.save("user://save.cfg")


func _on_BigTextButton_toggled(button_pressed: bool) -> void:
	global.corner_screen_fix = $"../BigTextButton".pressed
	global.config.set_value("Settings", "bigText", $"../BigTextButton".pressed)
	print($"../BigTextButton".pressed)
	global.config.save("user://save.cfg")
