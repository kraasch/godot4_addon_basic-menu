@tool
extends EditorPlugin

const NODE_NAME = "BasicMenu"
const INHERITANCE = "Node"
var THE_SCRIPT = preload("overlay_menu.gd")
var THE_ICON = preload("icon.png")

func _enter_tree():
	add_custom_type(NODE_NAME, INHERITANCE, THE_SCRIPT, THE_ICON)

func _exit_tree():
	remove_custom_type(NODE_NAME)
