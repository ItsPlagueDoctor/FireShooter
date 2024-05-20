extends Control

var lvlPoints = 1
var lvlPointsSpent = 0
@onready var flame_thrower_range = $"FlameThrower Range"
@onready var points = $Points
@onready var dmg_2 = $Dmg2
@onready var double_jump = $"Double Jump"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Levels/level_2.tscn")


func _on_dmg_pressed():
	if lvlPointsSpent < lvlPoints:
		GlobalVar.weapon_dmg_lvl = 2
		lvlPointsSpent += 1
		lvlPoints -= 1
		dmg_2.text = "Dmg Lvl " + str(GlobalVar.weapon_dmg_lvl)
		points.text = "Points avilable: " + str(lvlPoints)


func _on_flame_thrower_range_pressed():
	if lvlPointsSpent < lvlPoints:
		GlobalVar.flameThrowerRangeLvl = 2
		lvlPointsSpent += 1
		lvlPoints -= 1
		flame_thrower_range.text = "Flame Thrower Range lvl " + str(GlobalVar.flameThrowerRangeLvl)
		points.text = "Points avilable: " + str(lvlPoints)


func _on_double_jump_pressed():
	if lvlPointsSpent < lvlPoints:
		GlobalVar.jump_lvl = 2
		lvlPointsSpent += 1
		lvlPoints -= 1
		double_jump.text = "Double Jump Unlocked"
		points.text = "Points avilable: " + str(lvlPoints)
