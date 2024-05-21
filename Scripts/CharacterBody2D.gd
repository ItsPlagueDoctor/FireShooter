extends CharacterBody2D

const speed = 200
const jump = -500
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_chase = false
var wander_movment_ready = true


@onready var health_label = $Health
@onready var health_bar = $HealthBar

var moving = false
var motion = Vector2()
var wander_movment_ready2 = true
var move = true
var direction1 = 1
var alive = true
var mainCharacter = null

var health = 10
var can_take_health = true
var weapon_name = " "
var weapon_dmg = 0

func _ready():
	health_label.text = str(health)
	health_bar.value = health

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	if player_chase:
		var direction = position.direction_to(mainCharacter.position)
		direction.y = 0
		velocity.x = direction.normalized().x * speed
		#velocity = (mainCharacter.position - position).normalized() * speed
		#velocity = position.direction_to(mainCharacter.position) * speed
	else: 
		velocity.x = 0
		
		
		
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
				health_label.text = str(health)
				health_bar.value = health
			


func _on_area_2d_area_entered(area):
	if area.name == "FlameThrowerFlame":
		weapon_name = "Flamethrower"
		print(weapon_name, " bullet has hit enemy")
		if GlobalVar.weapon_dmg_lvl == 1:
			weapon_dmg = 2
		elif GlobalVar.weapon_dmg_lvl == 2:
			weapon_dmg = 4
		damage()
	

func _on_detection_area_body_entered(body):
	if body.has_method("MainCharacter"):
		mainCharacter = body
		player_chase = true
	
	


func _on_detection_area_body_exited(body):
	if body.has_method("MainCharacter"):
		player_chase = false
	
func enemy():
	pass
	
	
	
