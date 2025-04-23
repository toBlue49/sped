extends Control
var cam_zoom_y = 600.0
var fade_out_timer = 0
var fast_scroll = false

func _ready():
	########### FADE IN ###########
	fade_out_timer = 100
	for n in 26:
		fade_out_timer = fade_out_timer - 4
		$ColorRect.color = Color(0, 0, 0, fade_out_timer/90.0)
		yield(get_tree().create_timer(0.01),"timeout")
	fade_out_timer = 0

func _process(delta):
	if fast_scroll:
		$Scroll.rect_position.y = $Scroll.rect_position.y - 90 * delta
	else:
		$Scroll.rect_position.y = $Scroll.rect_position.y - 20 * delta
		
	if Input.is_action_just_pressed("ui_cancel"):
		exit_credits()
	
	if Input.is_action_just_pressed("ui_accept"):
		fast_scroll = true
	elif Input.is_action_just_released("ui_accept"):
		fast_scroll = false

func _on_scrollButton_button_up() -> void:
	fast_scroll = false

func _on_scrollButton_button_down() -> void:
	fast_scroll = true
	


func exit_credits() -> void:
	for n in 26:
		fade_out_timer = 4*n
		$ColorRect.color = Color(0, 0, 0, fade_out_timer/85.0)
		yield(get_tree().create_timer(0.01),"timeout")
	get_tree().change_scene("res://scenes/Objects/UI/Scene/MainScr.tscn")


func _on_Button_pressed() -> void:
	exit_credits()
