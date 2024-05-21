extends CharacterBody2D

var health = 100
var can_take_health = true
var weapon_name = " "
var weapon_dmg = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var alive = true
@onready var health_label = $"../CharacterBody2D/Health2"
@onready var health_bar = $"../CharacterBody2D/HealthBar2"
@onready var tent1 = $tent1
@onready var tent2 = $tent2
@onready var tent3 = $tent3
@onready var tent4 = $tent4
@onready var ex = $ex
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	attack()

func damage():
	if can_take_health:
		if health > 0:
			health = health - weapon_dmg
			if health <= 0:
				alive = false
				if not alive:
					health_label.queue_free()
					health_bar.queue_free()
					queue_free()
					print("enemy has died")
			elif health >  0:
				print(health)
				health_label.text = str(health)
				health_bar.value = health
var tent1isUp = false
var tent2isUp = false
var tent3isUp = false
var tent4isUp = false
var wait = true
func attack():
	var tween = get_tree().create_tween()
	var ran = randi_range(1,4)
	if wait == true:
		wait = false
		if ran == 1:
			if tent1isUp == false:
				ex.position = Vector2(tent1.position.x,-50)
				tween.tween_property(tent1, "position", tent1.position+Vector2(0,-100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				tent1isUp = true
			else:
				tween.tween_property(tent1, "position", tent1.position+Vector2(0,100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				tent1isUp = false
		if ran == 2:
			if tent2isUp == false:
				ex.position = Vector2(tent2.position.x,-50)
				tween.tween_property(tent2, "position", tent2.position+Vector2(0,-100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				
				tent2isUp = true
			else:
				tween.tween_property(tent2, "position", tent2.position+Vector2(0,100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				tent2isUp = false
		if ran == 3:
			if tent3isUp == false:
				ex.position = Vector2(tent3.position.x,-50)
				tween.tween_property(tent3, "position", tent3.position+Vector2(0,-100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				
				tent3isUp = true
			else:
				tween.tween_property(tent3, "position", tent3.position+Vector2(0,100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				tent3isUp = false
		if ran == 4:
			if tent4isUp == false:
				ex.position = Vector2(tent4.position.x,-50)
				tween.tween_property(tent4, "position", tent4.position+Vector2(0,-100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				
				tent4isUp = true
			else:
				tween.tween_property(tent4, "position", tent4.position+Vector2(0,100), 0.5).set_trans(Tween.TRANS_BOUNCE)
				tent4isUp = false
		await get_tree().create_timer(0.5).timeout
		wait = true
func _on_area_2d_area_entered(area):
	if area.name == "FlameThrowerFlame":
		weapon_name = "Flamethrower"
		print(weapon_name, " bullet has hit enemy")
		if GlobalVar.weapon_dmg_lvl == 1:
			weapon_dmg = 2
		elif GlobalVar.weapon_dmg_lvl == 2:
			weapon_dmg = 4
		damage()
		
	
func enemy():
	pass

func _on_area_2d_2_area_entered(area):
	print("damn")
