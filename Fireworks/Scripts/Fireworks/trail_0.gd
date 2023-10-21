class_name Trail_0
extends Node2D

static func create_and_add(pos: Vector2, dir: Vector2, color: Color, radius: float, exits_for_msec: float) -> void:
	var trail: = BaseTrail.create(pos, dir, color,
									exits_for_msec, radius,
									Trail_0._trail_draw, Trail_0._trail_update)

	GV.firework_launcher.list.append(trail)

static func _trail_draw(trail: Dictionary) -> void:
	var opacity: = float(trail.exist_for_msec - (Time.get_ticks_msec() - trail.created_at_msec)) / 100
	GV.firework_launcher.draw_circle(trail.pos, trail.radius,
									Color(trail.color.r, trail.color.g, trail.color.b, opacity))

static func _trail_update(_delta: float, trail: Dictionary) -> void:
	pass
