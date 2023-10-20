class_name BaseTrail
extends Node

static func create(init_pos: Vector2, init_dir: Vector2, init_color: Color, 
					draw_func: Callable, update_func: Callable) -> Dictionary:
	return {
		created_at_msec = Time.get_ticks_msec(),
		exist_for_msec = 500.0,
		draw_func = draw_func,
		update_func = update_func,

		pos = init_pos,
		dir = init_dir,
		color = init_color,
		remove_next_frame = false,
	}
