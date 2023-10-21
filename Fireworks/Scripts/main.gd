extends Node2D

func _ready():
	GV.horizontal_blur_color_rect.material.set_shader_parameter("WINDOW_W", Consts.WINDOW_W)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)
	GV.vertical_blur_color_rect.material.set_shader_parameter("WINDOW_H", Consts.WINDOW_H)
	GV.vertical_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.vertical_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)

func _process(_delta):
	if Input.is_action_just_pressed("MOUSE_LEFT"):
		Firework_2.create_and_add(0)

	if Input.is_action_just_pressed("KEY_2"):
		print(GV.firework_launcher.list.size())
