extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var inAttackRange = false
var attackCoolDown = true

var paused = false

var health = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $Sprite2D
@onready var pause_menu = $Camera2D/pauseMenu
func _ready():
	pause_menu.hide()

func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_axis("move left", "move right")
	if not is_on_floor():
		velocity.y += gravity * delta
		anim.play("jumpstate") 
	elif is_on_floor() and not direction:
		anim.play("idle") 
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.stop()
		anim.play("jump") 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			anim.play("run") 
		else:
			anim.play("jumpstate")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
	enemyAttack()
	if health <= 0:
		self.queue_free()
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()

			
		



func _on_hit_box_body_entered(body):
	if body.name == "Enemy":
		inAttackRange = true


func _on_hit_box_body_exited(body):
	inAttackRange = false
	
	
func enemyAttack():
	if inAttackRange and attackCoolDown:
		health = health - 20
		attackCoolDown = false
		$CoolDown.start()
		print(health)
		print("Player - 10 health")
	


func _on_cool_down_timeout():
	attackCoolDown = true


func pauseMenu():
	paused = !paused
	if paused:
		pause_menu.show()
		Engine.time_scale = 0
	else:
		pause_menu.hide()
		Engine.time_scale = 1
