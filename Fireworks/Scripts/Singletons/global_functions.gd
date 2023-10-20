extends Node

func rnd_pos_x() -> Vector2:
	return Vector2(randf_range(0, Consts.WINDOW_WH.x), Consts.WINDOW_H)

func rnd_pos() -> Vector2:
	return Vector2(randf_range(0, Consts.WINDOW_WH.x), randf_range(0, Consts.WINDOW_WH.y))

func rnd_dir() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

const RND_DIR_UP_ROTATION_RANGE: float = deg_to_rad(30)
func rnd_dir_up() -> Vector2:
	return Vector2(0, -1).rotated(randf_range(-RND_DIR_UP_ROTATION_RANGE, RND_DIR_UP_ROTATION_RANGE))
