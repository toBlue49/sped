extends KinematicBody2D



func _body_entered(body: Node) -> void:
	if body.get("TYPE") == "player":
		global.is_player_alive = false
		sound.playExplode()
