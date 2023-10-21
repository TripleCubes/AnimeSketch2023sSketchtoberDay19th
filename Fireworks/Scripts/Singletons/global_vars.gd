extends Node

@onready var firework_launcher: = get_node("/root/View/SubViewport/VerticalBlurred/SubViewport/HorizontalBlurred/SubViewport/Main/FireworkLauncher")
@onready var horizontal_blur_color_rect: = get_node("/root/View/SubViewport/VerticalBlurred/SubViewport/HorizontalBlurred/HorizontalBlur")
@onready var vertical_blur_color_rect: = get_node("/root/View/SubViewport/VerticalBlurred/VerticalBlur")
@onready var add_color_rect: = get_node("/root/View/Add")

@onready var unblurred_subviewport: SubViewport = get_node("/root/View/SubViewport/VerticalBlurred/SubViewport/HorizontalBlurred/SubViewport/")
@onready var bkg: ColorRect = get_node("/root/View/SubViewport/VerticalBlurred/SubViewport/HorizontalBlurred/SubViewport/Main/Bkg")
