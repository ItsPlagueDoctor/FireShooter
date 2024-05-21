extends Control

var lvlPoints = 1
var lvlPointsSpent = 0
@onready var flame_thrower_range = $"FlameThrower Range"
@onready var points = $Points
@onready var dmg_2 = $Dmg2
@onready var double_jump = $"Double Jump"


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVar.lvlup += 1
	if GlobalVar.lvlup == 2:
		points.text = "YOU GOT MORE DMG!!!!!"
		GlobalVar.weapon_dmg_lvl = 2
	elif GlobalVar.lvlup == 3:
		points.text = "MORE RANGEEEEEE!!!!!!"
		GlobalVar.flameThrowerRangeLvl = 2
	elif GlobalVar.lvlup == 4:
		points.text = "DOUBLE JUMPPPP"
		GlobalVar.jump_lvl = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	if GlobalVar.lvlup == 2:
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	elif GlobalVar.lvlup == 3:
		get_tree().change_scene_to_file("res://Levels/level_3.tscn")
	elif GlobalVar.lvlup == 4:
		get_tree().change_scene_to_file("res://Levels/level_4.tscn")
