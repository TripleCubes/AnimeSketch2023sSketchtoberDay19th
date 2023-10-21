class_name BaseFirework
extends Node

static func create(init_pos: Vector2, init_dir: Vector2, init_speed: float, init_color: Color, 
					depth: int, exist_for_msec, draw_func: Callable, update_func: Callable) -> Dictionary:
	return {
		created_at_msec = Time.get_ticks_msec(),
		exist_for_msec = exist_for_msec,
		depth = depth,
		draw_func = draw_func,
		update_func = update_func,

		pos = init_pos,
		dir = init_dir,
		speed = init_speed,
		color = init_color,
		remove_next_frame = false,

		trail_created = 0,
		trail_delay_msec = 5.0,
	}
