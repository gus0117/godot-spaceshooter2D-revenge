extends Node2D

const SPEED = 60

#Similar to Unity, when initialize variables in Start function.
@onready var explosion: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Another way to make conditionals
	match explosion:
		false: global_position.x -= SPEED * delta #Remember, negative indicate movement to the left

func explosion_ctrl() -> void :
	explosion = true
	$Area2D.queue_free()
	$Explosion.play("EXPLOSION")
	$Explosion/AudioExplosion.play()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_audio_explosion_finished():
	queue_free()
	
	if GLOBAL.credits <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_area_2d_area_entered(area):
	if area.is_in_group("Shot"):
		explosion_ctrl()
		GLOBAL.score += 100


func _on_area_2d_body_entered(body):
	# This is another way to indentify a node, using the class_name that it belongs.
	if body is Player:
		explosion_ctrl()
		body.queue_free()
		GLOBAL.credits -= 1
