extends Node

@onready var WINDOW_WH: Vector2 = get_viewport().size
@onready var WINDOW_W: float = WINDOW_WH.x
@onready var WINDOW_H: float = WINDOW_WH.y

const INTENSITY_MUL: float = 1
const BLUR_RANGE: float = 10
