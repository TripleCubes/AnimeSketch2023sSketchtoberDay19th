extends Node2D

func _ready():
	GV.horizontal_blur_color_rect.material.set_shader_parameter("WINDOW_W", Consts.WINDOW_W)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.horizontal_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)
	GV.vertical_blur_color_rect.material.set_shader_parameter("WINDOW_H", Consts.WINDOW_H)
	GV.vertical_blur_color_rect.material.set_shader_parameter("BLUR_RANGE", Consts.BLUR_RANGE)
	GV.vertical_blur_color_rect.material.set_shader_parameter("INTENSITY_MUL", Consts.INTENSITY_MUL)

func _on_show_characters_pressed():
	if not $UI/ShowCharacters.button_pressed:
		$Characters.hide()
		return

	$Characters.show()

func _on_show_ui_button_pressed():
	$UI.show()
	$ShowUIButton.hide()

func _on_hide_ui_button_pressed():
	$UI.hide()
	$ShowUIButton.show()

func _on_bkg_button_pressed():
	var firework_type = null
	if GV.click_to_launch_options.selected == 0:
		firework_type = DynamicFireworkLaunch.firework_type_list[randi_range(0, 3)]
	else:
		firework_type = DynamicFireworkLaunch.firework_type_list[GV.click_to_launch_options.selected - 1]
	firework_type.create_and_add(0, GF.mouse_pos())
