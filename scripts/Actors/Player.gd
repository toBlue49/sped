extends Actor

const TYPE = "player"
var fade_out_timer = 0.00
var unlocked_cam = false
var cam_zoom_x = 0
var cam_zoom_y = 0
var cam_zoom = 1

func _ready() -> void:
	print(self)
	########### Enable Player 2 ###########
	if global.LOCAL_MULTIPLAYER:
		$Player2.visible = true
	
	########### Get Config Settings ###########
	global.config.load("user://save.cfg") 
	global.show_trail = global.config.get_value("Settings", "showTrail", true)
	global.show_fps = global.config.get_value("Settings", "showFps", false)
	global.corner_screen_fix = global.config.get_value("Settings", "cornerScreenFix", false)
	global.big_text = global.config.get_value("Settings", "bigText", false)
	
	########### Corner Screen Fix ###########
	if global.corner_screen_fix:
		$CanvasLayer/CoinsleftLabel.rect_position.x = 60
		$CanvasLayer/TimerLabel.rect_position.x = 60
		$CanvasLayer/CurrLevelLabel.rect_position.x = 60
		$CanvasLayer/FpsLabel.rect_position.x = $CanvasLayer/FpsLabel.rect_position.x - 60
	
	########### Big Text Fix ###########
	if global.big_text:
		global.font_small.size = global.text_size[1]
		$CanvasLayer/CurrLevelLabel.rect_position.y = global.big_text_translation[3]
		$CanvasLayer/CoinsleftLabel.rect_position.y = global.big_text_translation[4]
		$CanvasLayer/TimerLabel.rect_position.y = global.big_text_translation[5]
		$CanvasLayer/Mobile/Menu.rect_position.y = global.big_text_translation[7]
	else:
		global.font_small.size = global.text_size[0]
		
	
	########### FPS Counter Visibility ###########
	if global.show_fps:
		$CanvasLayer/FpsLabel.visible = true
	else:
		$CanvasLayer/FpsLabel.visible = false
	
	########### FADE IN ###########
	fade_out_timer = 100
	for n in 26:
		fade_out_timer = fade_out_timer - 4
		$CanvasLayer/ColorRect.color = Color(0, 0, 0, fade_out_timer/90.0)
		yield(get_tree().create_timer(0.01),"timeout")
		if n == 3:
			$CanvasLayer/LoadingLabel.visible = false
	fade_out_timer = 0
	if unlocked_cam == true:
		$Camera2D.limit_left = -9999
		$Camera2D.limit_top = -9999
		$Camera2D.limit_right = 9999
		$Camera2D.limit_bottom = 9999

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if not global.gravity == gravity:
		gravity = global.gravity
	if global.is_player_alive == false:
		self.visible = false
	$CanvasLayer/CoinsleftLabel.text = "Coins Left: " + String(global.coins_left) #Shows Coins Left
	$CanvasLayer/CurrLevelLabel.text = "Current Level: " + String(global.level) #Shows Current Level
	
	########### CHANGE FRAMES ###########
	if Input.is_action_pressed("move_left"):
		$PlayerSprite.frame = 1
		global.velocity_sign = 0
	elif Input.is_action_pressed("move_right"):
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
	
	########### LEVEL COMPLETE FADE OUT ###########
	if global.level_complete == true && Input.is_action_just_pressed("ui_accept"):
		global.font_small.size = global.text_size[0]
		for n in 26:
			fade_out_timer = 4*n
			$CanvasLayer/ColorRect.color = Color(0, 0, 0, fade_out_timer/85.0)
			yield(get_tree().create_timer(0.01),"timeout")
		
	########### KEY PASSCODE ########### CTRL + D + G
	if Input.is_key_pressed(KEY_CONTROL) && Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_G):
		global.config.set_value("Level", "last_level", 69)
		
	########### GHOST TRAIL ###########
	if (global.is_player_alive) && global.show_trail:
		var this_ghost = preload("res://scenes/Actors/player_ghost.tscn").instance()
		get_parent().add_child_below_node($".", this_ghost)
		this_ghost.position = position
		
	########### FPS Counter ###########
	if global.show_fps:
		$CanvasLayer/FpsLabel.text = str(Engine.get_frames_per_second() , " FPS")
		
	########### R FOR RELOAD SCENE ###########
	if Input.is_action_just_pressed("reset"):
		global.font_small.size = global.text_size[0]
		global.is_player_alive = true
		global.reload_level()
		
	########### CAM ZOOMING ###########
	cam_zoom_x = get_viewport_rect().size.x/1024 - 1 #this is a little sketchy..
	cam_zoom_y = get_viewport_rect().size.y/600 - 1
	if cam_zoom_x >= 1.0:
		cam_zoom_x = 0.99
	if cam_zoom_y >= 1.0:
		cam_zoom_y = 0.99
	if cam_zoom_x >= cam_zoom_y:
		cam_zoom = cam_zoom_x / 2
	else:
		cam_zoom = cam_zoom_y / 2
	$Camera2D.zoom.x = 1 - cam_zoom #normal zoom
	$Camera2D.zoom.y = 1 - cam_zoom
	#$Camera2D.zoom.x = 6 #modded zoom
	#$Camera2D.zoom.y = 6
	# Scaling the Mobile Controls
	$CanvasLayer/Mobile/MoveX/Left.scale.x = 1 + cam_zoom
	$CanvasLayer/Mobile/MoveX/Left.scale.y = 1 + cam_zoom
	$CanvasLayer/Mobile/MoveX/Left.position.y = 0 - (1 + cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/MoveX/Right.scale.x = 1 + cam_zoom
	$CanvasLayer/Mobile/MoveX/Right.scale.y = 1 + cam_zoom
	$CanvasLayer/Mobile/MoveX/Right.position.y = 0 - (1 + cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/MoveX/Right.position.x = 136 + (1 + cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/Jump/Jump.scale.x = 1 + cam_zoom
	$CanvasLayer/Mobile/Jump/Jump.scale.y = 1 + cam_zoom
	$CanvasLayer/Mobile/Jump/Jump.position.y = 0 - (1 + cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/Jump/Jump.position.x = 0 - (1 + cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/Menu/Exit.scale.x = 1 + cam_zoom
	$CanvasLayer/Mobile/Menu/Exit.scale.y = 1 + cam_zoom
	$CanvasLayer/Mobile/Menu/Exit.position.x = 80 - (cam_zoom * (cam_zoom * 280))
	$CanvasLayer/Mobile/Menu/Reset.scale.x = 1 + cam_zoom
	$CanvasLayer/Mobile/Menu/Reset.scale.y = 1 + cam_zoom
	$CanvasLayer/Mobile/Menu/Reset.position.x = 0 - (cam_zoom * (cam_zoom * 420))

	print(cam_zoom)
	
# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if global.is_player_alive == true:
		var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0.0
		var direction: = get_direction()
		_velocity = calc_move_velocity(_velocity, direction, speed, is_jump_stopped)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
		
	#rotate cube
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#		$Rot_Tween.interpolate_property($PlayerSprite, rotation_degrees, $PlayerSprite.rotation_degrees, + 90, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#		$Rot_Tween.start()
	
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_pressed("jump") and is_on_floor() else 0.0
	)

func calc_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_stopped: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y + 300
		if is_jump_stopped:
			out.y = 0.0
	return out

