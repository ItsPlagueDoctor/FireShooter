extends Sprite2D

var can_fire = true
var flameThrowerFlame = preload("res://Scenes/flameThrowerFlame.tscn")




func _ready():
	set_as_top_level(true)
	
	
func _physics_process(_delta):
	position.x = lerp(position.x, get_parent().position.x + 5, 0.5)
	position.y = lerp(position.y, get_parent().position.y + 0, 0.5)
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if Input.is_action_pressed("shoot") and can_fire:
		var flame_instance = flameThrowerFlame.instantiate()
		flame_instance.rotation = rotation
		flame_instance.global_position = $Marker2D.global_position
		get_parent().add_child(flame_instance)
		can_fire = false
		await(get_tree().create_timer(0.2).timeout)
		can_fire = true
	
