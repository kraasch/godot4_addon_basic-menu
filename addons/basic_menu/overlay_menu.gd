extends Control
class_name OverlayMenu

#@export var node_to_pause : Node = null # TODO: maybe later, implement pausing parent.
@export var cards : Array[MenuCard] = []
@export var background_img : Texture2D = null # TODO: maybe later, as default create a gray background texture.
@export var cards_container : Node = null

var menu_card_scene = load("res://addons/basic_menu/menu_card.tscn")
var is_on_overlay : bool = false
var id_selected = 0
var input_disable_flags : Array[Callable] = []

func _process(_delta):
	process_input()

func _ready():
	$MarginContainer/TextureRect.texture = background_img
	self.visible = false

func process_input():
	# check if overlay is on or if cards container is set (cards container set = always on).
	if is_on_overlay or cards_container:
		if get_input_status():
			return
		if Input.is_action_just_pressed('custom_left') or Input.is_action_just_pressed('custom_right'):
			var selection_axis = Input.get_axis('custom_left', 'custom_right')
			move_focus(selection_axis)
		if Input.is_action_just_pressed('custom_confirm'):
			cards[id_selected].trigger_button_action()

func get_input_status():
	var is_disabled : bool = false
	if cards_container:
		for flag in input_disable_flags:
			if flag.call():
				is_disabled = true
				break
	return is_disabled

func add_input_disable_flag(input_disable_flag : Callable):
	input_disable_flags.push_back(input_disable_flag)

func get_is_on_overlay():
	return is_on_overlay

func move_focus(selection_axis : int):
	if cards.size() > 0:
		var old_selected_card : MenuCard = cards[id_selected]
		old_selected_card.unhighlight()
		var MIN_ID = 0
		var MAX_ID = cards.size() - 1
		if selection_axis == -1:
			id_selected = max(id_selected - 1, MIN_ID)
		elif selection_axis == 1:
			id_selected = min(id_selected + 1, MAX_ID)
		var newly_selected_card : MenuCard = cards[id_selected]
		newly_selected_card.highlight()

func add_card_action(action : Callable, text : String):
	var card : MenuCard = menu_card_scene.instantiate()
	card.button_action = action
	card.label_text = text
	if not cards_container:
		$MarginContainer/ButtonContainer.add_child(card)
	else:
		cards_container.add_child(card)
	cards.push_back(card)
	move_focus(-1)

func toggle_overlay():
	if not cards_container:
		if is_on_overlay:
			# turn off the overlay
			self.visible = false
			is_on_overlay = false
		else:
			# turn on the overlay
			self.visible = true
			is_on_overlay = true
