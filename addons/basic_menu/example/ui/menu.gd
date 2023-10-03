extends Control

@onready var card_scene : PackedScene = load('res://addons/basic_menu/menu_card.tscn')

@onready var overlay : OverlayMenu = $%OverlayMenu
@onready var core : OverlayMenu = $%CoreMenu

var levels : Array = [
	{ 'title' : 'level 1'},
	{ 'title' : 'level 2'},
	{ 'title' : 'level 3'},
	{ 'title' : 'level 4'},
]

func _ready():
	# set up menu interface.
	var level_index : int = 0
	for level in levels:
		core.add_card_action(start_level.bind(level_index), level['title'])
		level_index += 1
	core.add_input_disable_flag(overlay.get_is_on_overlay)
	# set up overlay.
	overlay.add_card_action(return_to_main, 'Quit')
	overlay.add_card_action(overlay.toggle_overlay, 'Continue')

func _process(_delta):
	process_input()

func process_input():
	if not overlay.is_on_overlay:
		if Input.is_action_just_pressed('custom_cancel'):
			overlay.toggle_overlay()

func return_to_main():
	SceneSwitcher.switch_scenes("res://data/src/scenes/ui/outro.tscn")

func start_level(level_id : int):
	SceneSwitcher.start_game('res://data/src/scenes/main/game.tscn', levels[level_id])
