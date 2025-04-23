extends Node

onready var font_small = preload("res://textures/Fonts/ConcertOne-font-small.tres")
onready var config = ConfigFile.new()
export var gravity: = 1777.7
var coins_left: int = 0
var level: int = 0
var level_complete: bool = false
var cam_up: int = 0
var cam_down: int = 0
var cam_left: int = 0
var cam_right: int = 0
var is_player_alive: bool = true
var velocity_sign = 0
var last_level = 0
var show_trail = true
var show_fps = false
var corner_screen_fix = false
var big_text = false
var fade_out_timer = 0.00
var LOCAL_MULTIPLAYER = false
var max_level_seconds = [
	18, #lvl1
	18,
	15,
	18,
	28,
	36,
	29,
	34,
	21,
	21, #lvl10
	28,
	23,
	21,
	30,
	30, #lvl15
	30, #lvlE1
	33,
	36,
	49,
	36,
	69420 #lvlE6
]
var text_size = [
	20,
	40
]
var big_text_translation = [
	1,  #small Level
	21, #small Coins
	40, #small Timer
	1,  #new Level
	37, #new Coins
	73, #new Timer
	24, #small Menu Mobile
	48, #big Menu mobile
]

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	################ PLAYER ALIVE ################
	if is_player_alive == false:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump"):
			is_player_alive = true
			# warning-ignore:return_value_discarded
			reload_level()
	
	################ LEVEL COMPLETE ################
	if coins_left == 0 and level != 0:
		level_complete = true
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("jump"):
			if last_level < level:
				last_level = level
			global.config.set_value("Level", "last_level", global.last_level)
			global.config.save("user://save.cfg")
			yield(get_tree().create_timer(0.27),"timeout")
			coins_left = 0
			level_complete = false
			is_player_alive = true
# warning-ignore:return_value_discarded
			if level == 21:
				level = 0
				get_tree().change_scene("res://scenes/Objects/UI/Scene/credits.tscn")
			elif level >= 16:
				level = 0
				get_tree().change_scene("res://scenes/Objects/UI/Scene/ExtraLevelScr.tscn")
			else:
				level = 0
				get_tree().change_scene("res://scenes/Objects/UI/Scene/LevelScr.tscn")
	
	################ CLOSE LEVEL ################
	if Input.is_action_just_released("ui_cancel"):
		global.font_small.size = global.text_size[0]
		level = 0
		coins_left = 0
		level_complete = false
		is_player_alive = true
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/Objects/UI/Scene/MainScr.tscn")

func reload_level(): # dont forget to update BOTH lists when adding levels :O
	global.font_small.size = global.text_size[0]
	if global.level == -420:
		global.coins_left = 42069
		global.level = global.level
		global.cam_down = 9999
		global.cam_up = -9999
		global.cam_left = -9999
		global.cam_right = 9999
	if global.level == 1:
		global.coins_left = 3
		global.level = global.level
		global.cam_down = 940
		global.cam_up = -320
		global.cam_left = 0
		global.cam_right = 2900
	if global.level == 2:
		global.coins_left = 10
		global.level = global.level
		global.cam_down = 770
		global.cam_up = -330
		global.cam_left = -108
		global.cam_right = 1675
	if global.level == 3:
		global.coins_left = 8
		global.level = global.level
		global.cam_down = 700
		global.cam_up = -172
		global.cam_left = -256
		global.cam_right = 1280
	if global.level == 4:
		global.coins_left = 11
		global.level = global.level
		global.cam_down = 700
		global.cam_up = -192
		global.cam_left = -576
		global.cam_right = 1280
	if global.level == 5:
		global.coins_left = 16
		global.level = global.level
		global.cam_down = 700
		global.cam_up = -830
		global.cam_left = 64
		global.cam_right = 1470
	if global.level == 6:
		global.coins_left = 14
		global.level = global.level
		global.cam_down = 1024
		global.cam_up = -448
		global.cam_left = -384
		global.cam_right = 1216
	if global.level == 7:
		global.coins_left = 16
		global.level = global.level
		global.cam_down = 1088
		global.cam_up = -512
		global.cam_left = -0
		global.cam_right = 1984
	if global.level == 8:
		global.coins_left = 22
		global.level = global.level
		global.cam_down = 576
		global.cam_up = -192
		global.cam_left = -64
		global.cam_right = 7872
	if global.level == 9:
		global.coins_left = 10
		global.level = global.level
		global.cam_down = 1088
		global.cam_up = -128
		global.cam_left = -256
		global.cam_right = 960
	if global.level == 10:
		global.coins_left = 9
		global.level = global.level
		global.cam_down = 576
		global.cam_up = -1216
		global.cam_left = 64
		global.cam_right = 1024
	if global.level == 11:
		global.coins_left = 13
		global.level = global.level
		global.cam_down = 640
		global.cam_up = -320
		global.cam_left = 64
		global.cam_right = 2688
	if global.level == 12:
		global.coins_left = 9
		global.level = global.level
		global.cam_down = 1088
		global.cam_up = 0
		global.cam_left = -1280
		global.cam_right = 1152
	if global.level == 13:
		global.coins_left = 9
		global.level = global.level
		global.cam_down = 832
		global.cam_up = -1024
		global.cam_left = -448
		global.cam_right = 960
	if global.level == 14:
		global.coins_left = 12
		global.level = global.level
		global.cam_down = 640
		global.cam_up = -1344
		global.cam_left = -256
		global.cam_right = 1152
	if global.level == 15:
		global.coins_left = 1
		global.level = global.level
		global.cam_down = 704
		global.cam_up = -1344
		global.cam_left = -128
		global.cam_right = 2048
	if global.level == 16:
		global.coins_left = 9
		global.level = global.level
		global.cam_down = 640
		global.cam_up = -640
		global.cam_left = -128
		global.cam_right = 3904
	if global.level == 17:
		global.coins_left = 12
		global.level = global.level
		global.cam_down = 576
		global.cam_up = -640
		global.cam_left = -64
		global.cam_right = 4288
	if global.level == 18:
		global.coins_left = 12
		global.level = global.level
		global.cam_down = 896
		global.cam_up = -2944
		global.cam_left = -256
		global.cam_right = 896
	if global.level == 19:
		global.coins_left = 14
		global.level = global.level
		global.cam_down = 864
		global.cam_up = -760
		global.cam_left = -1984
		global.cam_right = 1312
	if global.level == 20:
		global.coins_left = 11
		global.level = global.level
		global.cam_down = 824
		global.cam_up = -640
		global.cam_left = -192
		global.cam_right = 3328
	if global.level == 21:
		global.coins_left = 238
		global.level = global.level
		global.cam_down = 1500
		global.cam_up = -6400
		global.cam_left = -64
		global.cam_right = 30000
	get_tree().reload_current_scene()
