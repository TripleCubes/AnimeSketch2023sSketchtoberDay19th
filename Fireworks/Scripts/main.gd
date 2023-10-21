extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("MOUSE_LEFT"):
		Firework_1.create_and_add(0, GF.mouse_pos())
