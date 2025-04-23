extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(300, 6000)
export var speed2: = Vector2(300, 6000)
var _velocity: = Vector2.ZERO
var _velocity2: = Vector2.ZERO
var gravity = global.gravity

func _ready():
	if global.level == 8:
		gravity = 1200.7
	if global.level != 8:
		gravity = 1777.7
