extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("MOUSE_LEFT"):
		Firework_3.create_and_add(0, GF.mouse_pos())

	if Input.is_action_just_pressed("KEY_2"):
		print(GV.firework_launcher.list.size())
