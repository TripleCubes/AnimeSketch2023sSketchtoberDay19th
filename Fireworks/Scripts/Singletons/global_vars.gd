extends Node

@onready var firework_launcher: = get_node("/root/Main/FireworkLauncher/FireworkLauncher")
@onready var horizontal_blur_color_rect: = get_node("/root/Main/HorizontalBlurred/HorizontalBlur")
@onready var vertical_blur_color_rect: = get_node("/root/Main/VerticalBlurred/VerticalBlur")
@onready var add_color_rect: = get_node("/root/Main/Add")
@onready var auto_launch_firework_checkbox: CheckBox = get_node("/root/Main/UI/AutoLaunchFireworks")
@onready var click_to_launch_options: OptionButton = get_node("/root/Main/UI/ClickToLaunch")

@onready var bkg: ColorRect = get_node("/root/Main/FireworkLauncher/Bkg")
