extends Node

var current_scene : Node = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func switch_scenes(res_path : String):
	call_deferred('deferred_switch_scenes', res_path)

func deferred_switch_scenes(res_path : String):
	current_scene.free()
	var next_packed_scene : Resource = load(res_path)
	current_scene = next_packed_scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func start_game(res_path : String, game_data : Dictionary):
	call_deferred('deferred_start_game', res_path, game_data)

func deferred_start_game(res_path : String, game_data : Dictionary):
	current_scene.free()
	var next_packed_scene : Resource = load(res_path)
	var game : Game = next_packed_scene.instantiate()
	game.set_label(game_data['title'])
	current_scene = game
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
