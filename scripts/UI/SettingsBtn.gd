extends TextureButton

	
func _on_TextureButton_pressed() -> void:
	get_tree().change_scene("res://scenes/Objects/UI/Scene/OptionsScr.tscn")
