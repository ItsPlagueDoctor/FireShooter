extends Area2D

const bulletdrop = 500
const speed = 100
var velocity = Vector2.ZERO

func _ready():
	set_as_top_level(true)
	
func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta 
	position += Vector2.DOWN.rotated(rotation) * bulletdrop * delta
	
func _physics_process(delta):
	await(get_tree().create_timer(0.01).timeout)
	set_physics_process(false)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_body_entered(body):
	queue_free()
