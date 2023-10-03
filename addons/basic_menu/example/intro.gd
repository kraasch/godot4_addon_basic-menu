extends Control

func _on_timer_timeout():
	SceneSwitcher.switch_scenes("res://data/src/scenes/ui/menu.tscn")
