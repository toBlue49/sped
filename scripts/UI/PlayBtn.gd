tool
extends TextureButton

export(String, FILE) var next_scene_path: = ""
export var level_select: int = 0
var fade_out_timer = 0.00
export var is_extraLevel_button = false


func _ready() -> void:
	### GRAVITY RESET WHEN EXIT DIES DAS ANANAS ###
	global.gravity = 1777.7
	
	if is_extraLevel_button && global.last_level >= 15:
		self.visible = true
	elif is_extraLevel_button:
		self.visible = false
	global.last_level = global.config.get_value("Level", "last_level", 0)
	if level_select-1 <= global.last_level || level_select == 0:
		disabled = false
	else:
		disabled = true
	fade_out_timer = 100
	if level_select == -1:
		for n in 26:
		#	print("fade in " , fade_out_timer)
			fade_out_timer = fade_out_timer - 4
			$"../ColorRect".color = Color(0, 0, 0, fade_out_timer/90.0)
			yield(get_tree().create_timer(0.01),"timeout")
		print("joe! scene ready - LvlSel -1")
	else:
		for n in 26:
		#	print("fade in " , fade_out_timer)
			fade_out_timer = fade_out_timer - 4
			$"../../ColorRect".color = Color(0, 0, 0, fade_out_timer/90.0)
			yield(get_tree().create_timer(0.01),"timeout")
		print("joe! scene ready - Default")
	fade_out_timer = 0

func _button_up() -> void:
	if level_select == -420:
		global.coins_left = 42069
		global.level = level_select
		global.cam_down = 9999
		global.cam_up = -9999
		global.cam_left = -9999
		global.cam_right = 9999
	if level_select == 1:
		global.coins_left = 3
		global.level = level_select
		global.cam_down = 940
		global.cam_up = -320
		global.cam_left = 0
		global.cam_right = 2900
	if level_select == 2:
		global.coins_left = 10
		global.level = level_select
		global.cam_down = 770
		global.cam_up = -330
		global.cam_left = -108
		global.cam_right = 1675
	if level_select == 3:
		global.coins_left = 8
		global.level = level_select
		global.cam_down = 700
		global.cam_up = -172
		global.cam_left = -256
		global.cam_right = 1280
	if level_select == 4:
		global.coins_left = 11
		global.level = level_select
		global.cam_down = 700
		global.cam_up = -192
		global.cam_left = -576
		global.cam_right = 1280
	if level_select == 5:
		global.coins_left = 16
		global.level = level_select
		global.cam_down = 700
		global.cam_up = -830
		global.cam_left = 64
		global.cam_right = 1470
	if level_select == 6:
		global.coins_left = 14
		global.level = level_select
		global.cam_down = 1024
		global.cam_up = -448
		global.cam_left = -384
		global.cam_right = 1216
	if level_select == 7:
		global.coins_left = 16
		global.level = level_select
		global.cam_down = 1088
		global.cam_up = -512
		global.cam_left = -0
		global.cam_right = 1984
	if level_select == 8:
		global.coins_left = 22
		global.level = level_select
		global.cam_down = 576
		global.cam_up = -192
		global.cam_left = -64
		global.cam_right = 7872
	if level_select == 9:
		global.coins_left = 10
		global.level = level_select
		global.cam_down = 1088
		global.cam_up = -128
		global.cam_left = -256
		global.cam_right = 960
	if level_select == 10:
		global.coins_left = 9
		global.level = level_select
		global.cam_down = 576
		global.cam_up = -1216
		global.cam_left = 64
		global.cam_right = 1024
	if level_select == 11:
		global.coins_left = 13
		global.level = level_select
		global.cam_down = 640
		global.cam_up = -320
		global.cam_left = 64
		global.cam_right = 2688
	if level_select == 12:
		global.coins_left = 9
		global.level = level_select
		global.cam_down = 1088
		global.cam_up = 0
		global.cam_left = -1280
		global.cam_right = 1152
	if level_select == 13:
		global.coins_left = 9
		global.level = level_select
		global.cam_down = 832
		global.cam_up = -1024
		global.cam_left = -448
		global.cam_right = 960
	if level_select == 14:
		global.coins_left = 12
		global.level = level_select
		global.cam_down = 640
		global.cam_up = -1344
		global.cam_left = -256
		global.cam_right = 1152
	if level_select == 15:
		global.coins_left = 1
		global.level = level_select
		global.cam_down = 704
		global.cam_up = -1344
		global.cam_left = -128
		global.cam_right = 2048
	if level_select == 16:
		global.coins_left = 9
		global.level = level_select
		global.cam_down = 640
		global.cam_up = -640
		global.cam_left = -128
		global.cam_right = 3904
	if level_select == 17:
		global.coins_left = 12
		global.level = level_select
		global.cam_down = 576
		global.cam_up = -640
		global.cam_left = -64
		global.cam_right = 4288
	if level_select == 18:
		global.coins_left = 12
		global.level = level_select
		global.cam_down = 896
		global.cam_up = -2944
		global.cam_left = -256
		global.cam_right = 896
	if level_select == 19:
		global.coins_left = 14
		global.level = level_select
		global.cam_down = 864
		global.cam_up = -760
		global.cam_left = -1984
		global.cam_right = 1312
	if level_select == 20:
		global.coins_left = 11
		global.level = level_select
		global.cam_down = 824
		global.cam_up = -640
		global.cam_left = -192
		global.cam_right = 3328
	if level_select == 21:
		global.coins_left = 238
		global.level = level_select
		global.cam_down = 1500
		global.cam_up = -6400
		global.cam_left = -64
		global.cam_right = 30000

	fade_out_timer = 0
	if level_select == -1:
		self.disabled = true
		for n in 26:
			#print("fade out " , fade_out_timer)
			fade_out_timer = 4*n
			$"../ColorRect".color = Color(0, 0, 0, fade_out_timer/90.0)
			yield(get_tree().create_timer(0.01),"timeout")
		print("joe! change scene - LvlSel -1")
	else:
		for n in 26:
			#print("fade out " , fade_out_timer)
			fade_out_timer = 4*n
			$"../../ColorRect".color = Color(0, 0, 0, fade_out_timer/90.0)
			yield(get_tree().create_timer(0.01),"timeout")
		print("joe! change scene - Default")
		$"../../LoadingLabel".visible = true
	fade_out_timer = 0
		# warning-ignore:return_value_discarded
	yield(get_tree().create_timer(0.01),"timeout")
	get_tree().change_scene(next_scene_path)


func _get_configuration_warning() -> String:
	return "next_scene_path must be set" if next_scene_path == "" else ""

