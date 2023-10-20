class_name Firework_0
extends Node2D

static func create_and_add(depth: int, in_pos: = Vector2(0, 0)) -> void:
	var pos: Vector2
	var dir: Vector2
	if depth == 0:
		pos = GF.rnd_pos_x()
		dir = GF.rnd_dir_up()
	else:
		pos = in_pos
		dir = GF.rnd_dir()
	var firework: = BaseFirework.create(pos, dir, Color(1, 1, 1),
										depth, Firework_0._firework_draw, Firework_0._firework_update)

	firework.pop_h = randf_range(150, 350)

	GV.firework_launcher.list.append(firework)

static func _firework_draw(firework: Dictionary) -> void:
	GV.firework_launcher.draw_circle(firework.pos, 2, firework.color)

static func _firework_update(_delta: float, firework: Dictionary) -> void:
	firework.pos += firework.dir * _delta * 100

	if firework.depth == 0 and firework.pos.y <= firework.pop_h:
		_pop_firework(firework)

	if firework.depth == 0 \
	and firework.trail_created * firework.trail_delay_msec < Time.get_ticks_msec() - firework.created_at_msec:
		Trail_0.create_and_add(firework.pos, Vector2(0, 0))
		firework.trail_created += 1

static func _pop_firework(firework: Dictionary) -> void:
	for i in randf_range(7, 10):
		create_and_add(firework.depth + 1, firework.pos)

	firework.remove_next_frame = true
