extends Node

var _firework_type_list: = [
	Firework_0,
	Firework_1,
	Firework_2,
	Firework_3,
]

var _time_until_next_launch: float = 1

func _process(_delta):
	_time_until_next_launch -= _delta

	if _time_until_next_launch < 0:
		_time_until_next_launch = randf_range(3, 5)

		var dice: = randf_range(0, 10)
		if dice > 4:
			_launch()
		else:
			_launch_mixed()

func _launch() -> void:
	var firework_type = _firework_type_list[randi_range(0, 3)]
	for i in randi_range(2, 6):
		if firework_type == Firework_3 and i > 3:
			continue

		GF.wait(randf_range(0, 0.5), func():
			firework_type.create_and_add(0)
		)

func _launch_mixed() -> void:
	var firework_3_count: int = 0

	for i in randi_range(2, 5):
		var firework_type = _firework_type_list[randi_range(0, 3)]

		if firework_type == Firework_3:
			firework_3_count += 1
		
		if firework_type == Firework_3 and firework_3_count > 2:
			continue

		GF.wait(randf_range(0.2, 0.8), func():
			firework_type.create_and_add(0)
		)
