extends AnimationPlayer

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _process(delta: float) -> void:
	if global.coins_left == 0:
		anim_player.play("fade_in")
