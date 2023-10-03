extends Control
class_name MenuCard

@export var label_text : String = 'Does nothing.'
@export var button_action : Callable = pass_function

@onready var label : Label = $%CardLabel
var marked_color : Color = Color('red')
var default_color : Color = Color('black')

func highlight():
	label.add_theme_color_override('font_color', marked_color)

func unhighlight():
	label.add_theme_color_override('font_color', default_color)
	
func _ready():
	label.text = label_text

func set_button_action(button_action):
	self.button_action = button_action

func trigger_button_action():
	self.button_action.call()

func pass_function():
	pass
