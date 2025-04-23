extends Camera2D


func _ready() -> void:
	self.limit_left = global.cam_left
	self.limit_right = global.cam_right
	self.limit_top = global.cam_up
	self.limit_bottom = global.cam_down
