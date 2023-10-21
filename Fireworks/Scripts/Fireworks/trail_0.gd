class_name Trail_0
extends Node2D

static func create_and_add(pos: Vector2, dir: Vector2) -> void:
	var trail: = BaseTrail.create(pos, dir, Color(1, 1, 1),
										Trail_0._trail_draw, Trail_0._trail_update)

	GV.firework_launcher.list.append(trail)

static func _trail_draw(trail: Dictionary) -> void:
	var opacity: = float(trail.exist_for_msec - (Time.get_ticks_msec() - trail.created_at_msec)) / 100
	GV.firework_launcher.draw_circle(trail.pos, 1.5,
									Color(trail.color.r, trail.color.g, trail.color.b, opacity))

static func _trail_update(_delta: float, trail: Dictionary) -> void:
	pass
