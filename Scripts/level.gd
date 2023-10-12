extends Node2D

@export var enemy : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.score = 0
	GLOBAL.credits = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_bg(delta)
	
	#Move de pathFollow through its parent pathspawn at a certain speed.
	#It is use as reference for spawn enemies in its position.
	$PathSpawn/PathFollow.set_progress($PathSpawn/PathFollow.get_progress() + 80 * delta)

func parallax_bg(delta_time) -> void :
	#Move to left the background parallax
	#This one way of how to reference objects on scene.
	get_node("Background/back").scroll_base_offset -= Vector2(1, 0) * 4 * delta_time
	$Background/Planet_1.scroll_base_offset -= Vector2(1, 0) * 8 * delta_time
	$Background/Stars.scroll_base_offset -= Vector2(1, 0) * 16 * delta_time
	$Background/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta_time
	

func _on_timer_timeout():
	var enemy_instance = enemy.instance()
	enemy_instance.global_position = $pathSpawn/PathFollow.global_position
	add_child(enemy_instance)
