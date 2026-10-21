extends Control
var waiting_for: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for b in get_tree().get_nodes_in_group("Rebind"):
		b.focus_mode = Control.FOCUS_NONE
	$"Move left".text = OS.get_keycode_string(Settings.move_left_key)
	$"Move Right".text = OS.get_keycode_string(Settings.move_right_key)
	$"jump".text = OS.get_keycode_string(Settings.jump_key)
	$"rope".text = OS.get_keycode_string(Settings.rope_key)
	pass # Replace with function body.

func rebind_action(action: String, new_key: int):
	InputMap.action_erase_events(action)
	var ev := InputEventKey.new()
	ev.physical_keycode = new_key
	InputMap.action_add_event(action, ev)

func _input(event: InputEvent) -> void:
	if waiting_for != "" and event is InputEventKey and event.pressed:
		var new_key: int = event.physical_keycode
		match waiting_for:
			"move_left":
				Settings.move_left_key = new_key
				rebind_action("move_left", new_key)
		match waiting_for:
			"move_right":
				Settings.move_right_key = new_key
				rebind_action("move_right", new_key)
		match waiting_for:
			"jump":
				Settings.jump_key = new_key
				rebind_action("jump", new_key)
		match waiting_for:
			"rope":
				Settings.rope_key = new_key
				rebind_action("rope", new_key)
		waiting_for = ""
		$"Move left".text = OS.get_keycode_string(Settings.move_left_key)
		$"Move Right".text = OS.get_keycode_string(Settings.move_right_key)
		$"jump".text = OS.get_keycode_string(Settings.jump_key)
		$"rope".text = OS.get_keycode_string(Settings.rope_key)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	pass # Replace with function body.

func _on_move_left_pressed() -> void:
	waiting_for = "move_left"
	$"Move left".text = "Press a key..."
	pass # Replace with function body.

func _on_move_right_pressed() -> void:
	waiting_for = "move_right"
	$"Move Right".text = "Press a key..."
	pass # Replace with function body.

func _on_rope_pressed() -> void:
	waiting_for = "rope"
	$"rope".text = "Press a key..."
	pass # Replace with function body.


func _on_jump_pressed() -> void:
	waiting_for = "jump"
	$"jump".text = "Press a key..."
	pass # Replace with function body.
