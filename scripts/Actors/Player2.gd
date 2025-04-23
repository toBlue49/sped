extends Actor

const TYPE = "player"

func _ready() -> void:
	print(self)
	

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	########### CHANGE FRAMES ###########
	if Input.is_action_pressed("move_left2"):
		$PlayerSprite.frame = 1
		global.velocity_sign = 0
	elif Input.is_action_pressed("move_right2"):
		$PlayerSprite.frame = 2
		global.velocity_sign = 0
	elif _velocity.y > 0.1:
		$PlayerSprite.frame = 3
		global.velocity_sign = 1
	elif _velocity.y < -0.1:
		$PlayerSprite.frame = 4
		global.velocity_sign = -1
	else:
		$PlayerSprite.frame = 0
		global.velocity_sign = 0
		
	########### GHOST TRAIL ###########
	if (global.is_player_alive) && global.show_trail:
		var this_ghost = preload("res://scenes/Actors/player_ghost.tscn").instance()
		get_parent().add_child_below_node($".", this_ghost)
		this_ghost.position = position
	
# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if global.is_player_alive == true:
		var is_jump_stopped: = Input.is_action_just_released("jump2") and _velocity2.y < 0.0
		var direction: = get_direction()
		_velocity2 = calc_move_velocity2(_velocity2, direction, speed2, is_jump_stopped)
		_velocity2 = move_and_slide(_velocity2, FLOOR_NORMAL)
	
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right2") - Input.get_action_strength("move_left2"),
		-1.0 if Input.is_action_pressed("jump2") and is_on_floor() else 0.0
	)

func calc_move_velocity2(
		linear_velocity2: Vector2,
		direction: Vector2,
		speed2: Vector2,
		is_jump_stopped: bool
	) -> Vector2:
	var out: = linear_velocity2
	out.x = speed2.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed2.y * direction.y + 300
		if is_jump_stopped:
			out.y = 0.0
	return out

