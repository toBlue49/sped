extends HSlider


func _ready() -> void:
	$".".value = sound.musicVol

func _on_musicVolSlider_value_changed(value: float) -> void:
	sound.musicVol = $".".value
	global.config.set_value("Settings", "musicVolume", sound.musicVol)
	#print($".".value)
	global.config.save("user://save.cfg")
