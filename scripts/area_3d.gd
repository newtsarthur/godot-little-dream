extends Area3D

@export var next_scene_path: String = "res://scenes/end.tscn"

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		print("Player reached the flag. Changing scene in 5 seconds...")
		await get_tree().create_timer(0.35).timeout
		get_tree().change_scene_to_file(next_scene_path)
