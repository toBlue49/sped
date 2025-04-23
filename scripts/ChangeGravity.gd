extends Area2D
export var newgravity = 49.49

func _on_ChangeGravity_body_entered(body: Node) -> void:
	global.gravity = newgravity
	print("rild")
