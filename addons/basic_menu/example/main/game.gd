extends Control

class_name Game

@onready var overlay : OverlayMenu = $%OverlayMenu

func _ready():
	overlay.add_card_action(return_to_main, 'Quit')
	overlay.add_card_action(overlay.toggle_overlay, 'Continue')

func return_to_main():
	SceneSwitcher.switch_scenes("res://data/src/scenes/ui/menu.tscn")

func _process(_delta):
	process_input()

func process_input():
	if not overlay.is_on_overlay:
		if Input.is_action_just_pressed('custom_cancel'):
			overlay.toggle_overlay()

func set_label(text : String):
	$CenterContainer/Label.text = text
