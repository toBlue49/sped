extends KinematicBody2D

const idleDuration = 1.0

export var moveTo = Vector2.RIGHT * 192
export var speed = 300.0
var follow = Vector2.ZERO

func _ready() -> void:
	init_tween()
	
func init_tween():
	var duration = moveTo.length() / float(speed)
	$Tween.interpolate_property(self, "follow", Vector2.ZERO, moveTo, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, idleDuration)
	$Tween.interpolate_property(self, "follow", moveTo, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + idleDuration * 2)
	$Tween.start()
	
func _physics_process(delta: float) -> void:
	$"CollisionShape2D".position = $"CollisionShape2D".position.linear_interpolate(follow, 0.075)
