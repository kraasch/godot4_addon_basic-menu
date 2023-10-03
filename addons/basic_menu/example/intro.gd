extends Control

func _on_timer_timeout():
	SceneSwitcher.switch_scenes("ui/menu.tscn")
