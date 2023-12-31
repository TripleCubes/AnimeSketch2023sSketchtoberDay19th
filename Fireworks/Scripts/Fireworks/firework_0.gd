class_name Firework_0
extends Node2D

static func create_and_add(depth: int, in_pos_dir: = Vector2(0, 0), exist_for_msec: float = 10000) -> void:
	var pos: Vector2
	var dir: Vector2
	if depth == 0:
		pos = GF.rnd_pos_x()
		if in_pos_dir == Vector2(0, 0):
			dir = GF.rnd_dir_up()
		else:
			dir = (in_pos_dir - pos).normalized()
	else:
		pos = in_pos_dir
		dir = GF.rnd_dir_bias_up()

	var firework: = BaseFirework.create(pos, dir, randf_range(200, 350), Color(1, 1, 1),
										depth, exist_for_msec, randf_range(Consts.MAX_FIREWORK_H, Consts.MIN_FIREWORK_H), 
										randf_range(0.1, 0.5), 1,
										5,
										Firework_0._firework_draw, Firework_0._firework_update)

	firework.actual_pos = pos

	GV.firework_launcher.list.append(firework)

static func _firework_draw(firework: Dictionary) -> void:
	if GF.out_of_window(firework.pos):
		return

	var opacity: = float(firework.exist_for_msec - (Time.get_ticks_msec() - firework.created_at_msec)) / 100
	GV.firework_launcher.draw_circle(firework.actual_pos, firework.radius, 
									Color(firework.color.r, firework.color.g, firework.color.b, opacity))

static func _firework_update(_delta: float, firework: Dictionary) -> void:
	var speed_mul: float = 1

	if firework.depth == 0:
		speed_mul = ((firework.pos.y - firework.pop_h) / 300) * 2 + 0.1

	firework.pos += firework.dir * _delta * firework.speed * speed_mul

	if firework.depth >= 1:
		firework.pos += Vector2(0, firework.gravity * (float(Time.get_ticks_msec()) - firework.created_at_msec)) * _delta

	if firework.depth == 0:
		var angle: float = firework.pos.angle_to_point(firework.pos + firework.dir) + PI/2
		var time: = float(Time.get_ticks_msec()) / 100
		var wave: float = sin(time) * sin(time/2 + 0.5) * cos(time/3 + time) * 1.25 * speed_mul
		firework.actual_pos = firework.pos + Vector2(wave, 0).rotated(angle)
	else:
		firework.actual_pos = firework.pos

	if firework.depth == 0 and firework.pos.y <= firework.pop_h:
		_pop_firework(firework)

	if firework.trail_created * firework.trail_delay_msec < Time.get_ticks_msec() - firework.created_at_msec:
		Trail_0.create_and_add(firework.actual_pos, Vector2(0, 0), Color(1, 1, 1), 1, 300)
		firework.trail_created += 1

static func _pop_firework(firework: Dictionary) -> void:
	for i in randf_range(7, 10):
		create_and_add(firework.depth + 1, firework.pos, randf_range(400, 600))

	GF.bkg_glow(1.3)
	firework.remove_next_frame = true
