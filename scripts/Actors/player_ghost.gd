extends Node2D

func _ready():
	#$ghost_sprite.modulate.a = 0
	if Input.is_action_pressed("move_left"):
		$ghost_sprite.frame = 1
	elif Input.is_action_pressed("move_right"):
		$ghost_sprite.frame = 2
	elif global.velocity_sign == 1:
		$ghost_sprite.frame = 3
	elif global.velocity_sign == -1:
		$ghost_sprite.frame = 4
	else:
		$ghost_sprite.frame = 0
	#Create Animation (fade)
	$ghost_sprite.visible = true
	$ghost_sprite/alpha_Tween.interpolate_property($ghost_sprite, "modulate", Color(1, 1, 1, 0.4), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$ghost_sprite/alpha_Tween.start()


func _on_tween_completed(object: Object, key: NodePath) -> void:
	queue_free()
