extends Node

@onready var firework_launcher: = get_node("/root/Main/FireworkLauncher/FireworkLauncher")
@onready var horizontal_blur_color_rect: = get_node("/root/Main/HorizontalBlurred/HorizontalBlur")
@onready var vertical_blur_color_rect: = get_node("/root/Main/VerticalBlurred/VerticalBlur")
@onready var add_color_rect: = get_node("/root/Main/Add")

@onready var bkg: ColorRect = get_node("/root/Main/FireworkLauncher/Bkg")
