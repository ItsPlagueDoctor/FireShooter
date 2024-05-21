extends Area2D

const FILEPATH = "res://Levels/level_"
var lvlUp = true

func _on_body_entered(body):
	print(body)
	if body.has_method("MainCharacter"):
		if lvlUp:
			get_tree().change_scene_to_file("res://Scenes/level_up_screen.tscn")
