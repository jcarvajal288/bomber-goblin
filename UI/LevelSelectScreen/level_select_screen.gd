extends CanvasLayer

var selection: int = 0

const MAIN_MENU_SCENE: String = "res://UI/MainMenu/MainMenu.tscn"
const GAMEPLAY_SCENE: PackedScene = preload("res://gameplay.tscn")

@onready var level_1_option = $LevelOptionsContainer/Level1Label
@onready var level_2_option = $LevelOptionsContainer/Level2Label
@onready var back_to_main_menu_option = $LevelOptionsContainer/BackLabel

@onready var menu_options = [
	level_1_option,
	level_2_option,
	back_to_main_menu_option
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
	if selection == 2:
		get_tree().change_scene_to_file(MAIN_MENU_SCENE)
	else:
		start_game()


func start_game() -> void:
	var gameplay_scene = GAMEPLAY_SCENE.instantiate()
	gameplay_scene.starting_level = selection + 1
	var current_scene = get_tree().current_scene
	get_tree().root.add_child(gameplay_scene)
	get_tree().current_scene = gameplay_scene
	current_scene.queue_free()