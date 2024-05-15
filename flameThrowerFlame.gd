extends Area2D

const bulletdrop = 500
const speed = 400
var velocity = Vector2.ZERO
var mark = preload("res://Scenes/mark.tscn")
@onready var anim = $Sprite2D
func _ready():
	set_as_top_level(true)
	anim.set_frame_and_progress(0, randf_range(0, 1))
	
func _process(delta):
	velocity.y += gravity * delta  # Apply gravity to the velocity
	position += velocity * delta  # Move the bullet based on the updated velocity
	position += Vector2.RIGHT.rotated(rotation) * speed * delta
	
func _physics_process(_delta):
	await(get_tree().create_timer(0.01).timeout)
	set_physics_process(false)
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_body_entered(body):

	queue_free()

