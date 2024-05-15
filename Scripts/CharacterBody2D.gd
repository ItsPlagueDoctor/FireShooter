extends CharacterBody2D

const speed = 200
const jump = -500
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_chase = false

var motion = Vector2()

var move = true
var direction1 = 1
var alive = true
var mainCharacter = null

var health = 10
var can_take_health = true
var weapon_name = " "
var weapon_dmg = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if player_chase:
		velocity = (mainCharacter.position - position).normalized() * speed
		velocity = position.direction_to(mainCharacter.position) * speed
	move_and_slide()
	

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
	if area.name == "FlameThrowerFlame":
		weapon_name = "Flamethrower"
		print(weapon_name, " bullet has hit enemy")
		weapon_dmg = 2
		damage()
	

func _on_detection_area_body_entered(body):
	mainCharacter = body
	player_chase = true
	
	


func _on_detection_area_body_exited(body):
	player_chase = false
