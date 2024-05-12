extends Area2D

const speed = 2000
var timer = 0.0
var wait_time = 0.01

func _ready():
	set_as_top_level(true)
	
func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta
	
func _physics_process(delta):
	timer += delta
	if timer >= wait_time:
		set_physics_process(false)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_body_entered(body):
	queue_free()
