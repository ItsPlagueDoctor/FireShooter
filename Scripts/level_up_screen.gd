extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Levels/level_2.tscn")


func _on_dmg_pressed():
	GlobalVar.weapon_dmg_lvl = 2
