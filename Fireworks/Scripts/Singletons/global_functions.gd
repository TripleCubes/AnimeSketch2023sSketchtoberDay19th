extends Node2D

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
