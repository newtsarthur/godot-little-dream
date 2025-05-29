extends Control

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("button"):
		button.pressed.connect(_on_button_pressed.bind(button))
		button.mouse_exited.connect(mouse_interaction.bind(button, "exited"))
		button.mouse_entered.connect(mouse_interaction.bind(button, "entered"))

func _on_button_pressed(button: Button) -> void:
	match button.name:
		"Play":
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		"Controls":
			get_tree().change_scene_to_file("res://scenes/constrols.tscn")
		"Quit":
			get_tree().quit()
		"Back":
			get_tree().change_scene_to_file("res://scenes/menu.tscn")

func mouse_interaction(button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5
