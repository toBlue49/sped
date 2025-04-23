extends AudioStreamPlayer
var musicVol = 0.0
var explodeVol = 0.0

func _ready() -> void:
	global.config.load("user://save.cfg")
	musicVol = global.config.get_value("Settings", "musicVolume", -5.0)
	explodeVol = global.config.get_value("Settings", "explodeVolume", -5.0)


func _process(delta: float) -> void:
	$".".volume_db = musicVol
	$AudioStreamPlayerEXP.volume_db = explodeVol
	
func playExplode():
	$AudioStreamPlayerEXP.play()
