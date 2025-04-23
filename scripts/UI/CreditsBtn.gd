extends Button
var fade_out_timer = 100.0

func _on_pressed():
	########### FADE IN ###########
	fade_out_timer = 100
	for n in 26:
		fade_out_timer = n*4
		$"../ColorRect".color = Color(0, 0, 0, fade_out_timer/90.0)
		yield(get_tree().create_timer(0.01),"timeout")
	fade_out_timer = 0
	get_tree().change_scene("res://scenes/Objects/UI/Scene/credits.tscn")
