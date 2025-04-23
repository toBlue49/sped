extends HSlider


func _ready() -> void:
	$".".value = sound.explodeVol

func _on_explodeVolSlider_value_changed(value: float) -> void:
	sound.explodeVol = $".".value
	global.config.set_value("Settings", "explodeVolume", sound.explodeVol)
	global.config.save("user://save.cfg")
	
	#Show LOUD! :O Warning
	if sound.explodeVol > -5.0:
		$Warning.visible = true
		
	#Disable LOUD! :O Warning
	if sound.explodeVol < -5.0:
		$Warning.visible = false
