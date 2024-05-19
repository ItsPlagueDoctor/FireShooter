extends Area2D

const FILEPATH = "res://Levels/level_"
var lvlUp = true

func _on_body_entered(body):
	print(body)
	if body.name == "CharacterBody2D":
		if lvlUp:
			get_tree().change_scene_to_file("res://Scenes/level_up_screen.tscn")
		else:
			var current_scene_file = get_tree().current_scene.scene_file_path
			var next_level_number = current_scene_file.to_int() + 1
		
			var next_level_path = FILEPATH + str(next_level_number) + ".tscn"
			get_tree().change_scene_to_file(next_level_path)
