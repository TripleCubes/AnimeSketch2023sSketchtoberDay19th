class_name BaseFirework
extends Node

const FIREWORK_EXIST_FOR_MSEC: = 10000
# const FIREWORK_EXIST_FOR_MSEC: = 2000

static func create(init_pos: Vector2, init_dir: Vector2, init_color: Color, 
					depth: int, draw_func: Callable, update_func: Callable) -> Dictionary:
	return {
		created_at_msec = Time.get_ticks_msec(),
		exist_for_msec = FIREWORK_EXIST_FOR_MSEC,
		depth = depth,
		draw_func = draw_func,
		update_func = update_func,

		pos = init_pos,
		dir = init_dir,
		color = init_color,
		remove_next_frame = false,

		trail_created = 0,
		trail_delay_msec = 50.0,
	}
