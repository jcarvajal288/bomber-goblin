extends CanvasLayer

var selection: int = 0

const LEVEL_SELECT_SCENE: PackedScene = preload("res://UI/LevelSelectScreen/LevelSelectScreen.tscn")

@onready var start_option = $MenuOptionsContainer/Start
@onready var quit_option = $MenuOptionsContainer/Quit

@onready var menu_options = [
	start_option,
	quit_option
]

func _ready() -> void:
	menu_options[selection].modulate = Color.YELLOW


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		selection = (selection + 1) % len(menu_options)
		change_selection()
	elif Input.is_action_just_pressed("ui_up"):
		selection = (selection - 1) % len(menu_options)
		change_selection()
	elif Input.is_action_just_pressed("ui_accept"):
		perform_action()


func change_selection() -> void:
	for option in menu_options:
		option.modulate = Color.WHITE
	menu_options[selection].modulate = Color.YELLOW


func perform_action() -> void:
	if selection == 0:
		get_tree().change_scene_to_packed(LEVEL_SELECT_SCENE)
	elif selection == 1:
		get_tree().quit()
		
