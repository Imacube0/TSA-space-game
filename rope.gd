extends Line2D
@onready var player = get_node("../")
signal pull

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	global_position = Vector2.ZERO
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# start of rope = player.pos.x
	# end of rope = raycast global mouse pos (find collision or wtv idk do it bruh
	# if diff.y(of player.pos.y and end of rope.y) < diff.x(same two):
	#	if (player.pos.x < end of rope.x and Input.is_action_last_pressed("move_left") or (player.pos.x > end of rope.x and Input.is_action_last_pressed("move_right")):
	#      player.speed *= 0.05
	#      pull.emit()
	if get_point_count() != 0:
		set_point_position(0, player.global_position)
	pass


func _on_player_rope() -> void:
	if get_point_count() == 0:
		var space_state = get_world_2d().direct_space_state
		var rope_path = PhysicsRayQueryParameters2D.create(player.global_position, get_global_mouse_position())
		rope_path.exclude = [player.get_rid()]
		var result = space_state.intersect_ray(rope_path)
		if result:
			add_point(player.global_position)
			add_point(result.position)
		pass
	else:
		clear_points()
	pass # Replace with function body.
