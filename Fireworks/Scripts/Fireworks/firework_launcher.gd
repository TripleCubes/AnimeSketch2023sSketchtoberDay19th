extends Node2D

var list: = []

func _draw():
	for firework in list:
		firework.draw_func.call(firework)

func _process(_delta):		
	for i in range(list.size() - 1, -1, -1):
		var firework = list[i]

		if firework.remove_next_frame:
			list.remove_at(i)
			continue

		if Time.get_ticks_msec() - firework.created_at_msec > firework.exist_for_msec:
			list.remove_at(i)
			continue

		firework.update_func.call(_delta, firework)

	queue_redraw()
