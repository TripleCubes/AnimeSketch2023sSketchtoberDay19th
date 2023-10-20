class_name Trail_0
extends Node2D

static func create_and_add(pos: Vector2, dir: Vector2) -> void:
	var trail: = BaseTrail.create(pos, dir, Color(1, 1, 1),
										Trail_0._trail_draw, Trail_0._trail_update)

	GV.firework_launcher.list.append(trail)

static func _trail_draw(trail: Dictionary) -> void:
	GV.firework_launcher.draw_circle(trail.pos, 1.5, trail.color)

static func _trail_update(_delta: float, trail: Dictionary) -> void:
	pass
