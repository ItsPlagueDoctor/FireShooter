extends CharacterBody2D

const speed = 500
const jump = -500
const gravity = 20
const UP = Vector2(0, -1)

var motion = Vector2()

var move = true
var direction1 = 1
var alive = true

var health = 10
var can_take_health = true
var weapon_name = " "
var weapon_dmg = 0


func damage():
	if can_take_health:
		if health > 0:
			health = health - weapon_dmg
			if health <= 0:
				alive = false
				if not alive:
					queue_free()
					print("enemy has died")
			elif health >  0:
				print(health)
			


func _on_area_2d_area_entered(area):
	weapon_name = "Flamethrower"
	print(weapon_name, " bullet has hit enemy")
	weapon_dmg = 2
	damage()
