extends Node2D

func wait(time: float, callable: Callable) -> void:
	var timer: = get_tree().create_timer(time)
	timer.timeout.connect(callable)

func tween(obj, property: NodePath, value: Variant, time: float, sine: bool) -> void:
	var tween_var: = get_tree().create_tween()
	if sine:
		tween_var.tween_property(obj, property, value, time).set_trans(Tween.TRANS_SINE)
	else:
		tween_var.tween_property(obj, property, value, time)



func mouse_pos() -> Vector2:
	return get_global_mouse_position()

func rnd_pos_x() -> Vector2:
	return Vector2(randf_range(0, Consts.WINDOW_WH.x), Consts.WINDOW_H)

func rnd_pos() -> Vector2:
	return Vector2(randf_range(0, Consts.WINDOW_WH.x), randf_range(0, Consts.WINDOW_WH.y))

func rnd_dir() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

const RND_DIR_UP_ROTATION_RANGE: float = deg_to_rad(30)
func rnd_dir_up() -> Vector2:
	return Vector2(0, -1).rotated(randf_range(-RND_DIR_UP_ROTATION_RANGE, RND_DIR_UP_ROTATION_RANGE))

func rnd_dir_bias_up() -> Vector2:
	var dice: = randf_range(0, 10)
	
	if dice > 2:
		return Vector2(0, -1).rotated(randf_range(-PI/2, PI/2))

	return Vector2(0, 1).rotated(randf_range(-PI/2, PI/2))



var _bkg_glow_modulate: float = 1
func bkg_glow(intensity: float) -> void:
	_bkg_glow_modulate = intensity

func _bkg_glow_process(_delta: float):
	_bkg_glow_modulate -= _delta
	if _bkg_glow_modulate < 1:
		_bkg_glow_modulate = 1
	GV.bkg.modulate = Color(_bkg_glow_modulate, _bkg_glow_modulate, _bkg_glow_modulate, 1)

func _process(_delta):
	_bkg_glow_process(_delta)
