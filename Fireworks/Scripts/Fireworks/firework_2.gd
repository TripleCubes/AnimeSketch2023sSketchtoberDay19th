class_name Firework_2
extends Node2D

static func create_and_add(depth: int, in_pos_dir: = Vector2(0, 0), exist_for_msec: float = 10000) -> void:
	var pos: Vector2
	var dir: Vector2	
	var speed: float
	if depth == 0:		
		speed = randf_range(200, 350)
		pos = GF.rnd_pos_x()
		if in_pos_dir == Vector2(0, 0):
			dir = GF.rnd_dir_up()
		else:
			dir = (in_pos_dir - pos).normalized()
	else:		
		speed = randf_range(80, 120)
		dir = GF.rnd_dir_bias_up()
		pos = in_pos_dir + dir * randf_range(5, 30)

	var firework: = BaseFirework.create(pos, dir, speed, Color("B2FFF2"),
										depth, exist_for_msec, randf_range(150, 350), randf_range(0.01, 0.06), 1,
										5,
										Firework_2._firework_draw, Firework_2._firework_update)

	firework.actual_pos = pos

	GV.firework_launcher.list.append(firework)

static func _firework_draw(firework: Dictionary) -> void:
	if firework.depth == 0 and firework.pos.y < firework.pop_h:
		return

	var opacity: = float(firework.exist_for_msec - (Time.get_ticks_msec() - firework.created_at_msec)) / 100
	GV.firework_launcher.draw_circle(firework.actual_pos, firework.radius, 
									Color(firework.color.r, firework.color.g, firework.color.b, opacity))

static func _firework_update(_delta: float, firework: Dictionary) -> void:
	if firework.depth != 0 or firework.pos.y > firework.pop_h:
		firework.pos += firework.dir * _delta * firework.speed

	if firework.depth >= 1:
		firework.pos += Vector2(0, firework.gravity * (float(Time.get_ticks_msec()) - firework.created_at_msec)) * _delta

	if firework.depth == 0:
		var angle: float = firework.pos.angle_to_point(firework.pos + firework.dir) + PI/2
		var time: = float(Time.get_ticks_msec()) / 100
		var wave: float = sin(time) * sin(time/2 + 0.5) * cos(time/3 + time) * 1.25
		firework.actual_pos = firework.pos + Vector2(wave, 0).rotated(angle)
	else:
		firework.actual_pos = firework.pos

	if firework.depth == 0 and firework.pos.y <= firework.pop_h:
		_pop_firework(firework)



	var draw_trail: = false
	if firework.pos.y > firework.pop_h \
	and firework.trail_created * firework.trail_delay_msec < Time.get_ticks_msec() - firework.created_at_msec:
		draw_trail = true

	if firework.depth >= 1:
		draw_trail = true

	if draw_trail:
		if firework.depth == 0:
			Trail_0.create_and_add(firework.actual_pos, Vector2(0, 0), Color("B2FFF2"), 1, 300)
		else:
			Trail_0.create_and_add(firework.actual_pos, Vector2(0, 0), Color("B2FFF2"), 1, 100)
		firework.trail_created += 1

static func _pop_firework(firework: Dictionary) -> void:
	GF.wait(0.6, func():
		for i in randf_range(14, 20):
			create_and_add(firework.depth + 1, firework.pos, randf_range(1000, 1500))

		GF.bkg_glow(1.3)
	)
	firework.remove_next_frame = true
