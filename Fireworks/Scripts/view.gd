extends Node2D

func _ready():
	if not Consts.GLOW_ENABLED:
		GV.horizontal_blur_color_rect.hide()
		GV.vertical_blur_color_rect.hide()
		GV.add_color_rect.hide()
		return

	# GV.horizontal_blur_color_rect.hide()
	# GV.vertical_blur_color_rect.hide()
	# GV.add_color_rect.hide()

	GV.horizontal_blur_color_rect.material.set_shader_parameter("WINDOW_W", Consts.WINDOW_W)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)
	GV.vertical_blur_color_rect.material.set_shader_parameter("WINDOW_H", Consts.WINDOW_H)
	GV.vertical_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.vertical_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)

func _process(_delta):
	GV.add_color_rect.material.set_shader_parameter("unblurred_texture", GV.unblurred_subviewport.get_texture())
