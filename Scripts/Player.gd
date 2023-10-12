extends CharacterBody2D
class_name Player

@export var shot : PackedScene

@onready var screensize = get_viewport_rect().size


const SPEED = 80

func _process(delta):
	anim_ctrl()
	motion_ctrl()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		shot_ctrl()

func anim_ctrl() -> void:
	if GLOBAL.get_axis().y > 0:
		$Spaceship.animation = "UP"
	elif GLOBAL.get_axis().y < 0:
		$Spaceship.animation = "DOWN"
	else:
		$Spaceship.animation = "IDLE"


func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x
	velocity.y = GLOBAL.get_axis().y
	
	move_and_slide()
	
	# To clamp player movement between 0 and screensize
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func shot_ctrl() -> void:
	$Flash.play("FLASH")
	$Settings/AudioShoot.play()
	
	var shot_instance = shot.instance()
	shot_instance.global_position = $Settings/ShootSpawn.global_position
	get_tree().call_group("Level", "add_child", shot_instance)
