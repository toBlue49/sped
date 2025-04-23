extends Area2D

export var type:int = 0
onready var group1 = $"../group1"
onready var group2 = $"../group2"
onready var group3 = $"../group3"
onready var group4 = $"../group4"
onready var group5 = $"../group5"

func _on_body_entered(body: Node) -> void:
	print("$", group1)
	if type == 1:
		group1.visible = true
		group2.visible = false
		group3.visible = false
		group4.visible = false
		group5.visible = false
		group1.set_process(true)
		group2.set_process(false)
		group3.set_process(false)
		group4.set_process(false)
		group5.set_process(false)
	if type == 2:
		group1.visible = false
		group2.visible = true
		group3.visible = false
		group4.visible = false
		group5.visible = false
		group1.set_process(false)
		group2.set_process(true)
		group3.set_process(false)
		group4.set_process(false)
		group5.set_process(false)
	if type == 3:
		group1.visible = false
		group2.visible = false
		group3.visible = true
		group4.visible = false
		group5.visible = false
		group1.set_process(false)
		group2.set_process(false)
		group3.set_process(true)
		group4.set_process(false)
		group5.set_process(false)
	if type == 4:
		group1.visible = false
		group2.visible = false
		group3.visible = false
		group4.visible = true
		group5.visible = false
		group1.set_process(false)
		group2.set_process(false)
		group3.set_process(false)
		group4.set_process(true)
		group5.set_process(false)
	if type == 5:
		group1.visible = false
		group2.visible = false
		group3.visible = false
		group4.visible = false
		group5.visible = true
		group1.set_process(false)
		group2.set_process(false)
		group3.set_process(false)
		group4.set_process(false)
		group5.set_process(true)
