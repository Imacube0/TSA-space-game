extends Control

var music = AudioServer.get_bus_index("Master")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Volume IN".value = Settings.volume
	$"Debug mode IN".button_pressed = Settings.dm
	$"DAS IN".value = Settings.DAS
	$"ARR IN".value = Settings.ARR
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music, linear_to_db(value))
	Settings.volume = int(value)
	pass 


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	pass 


func _on_das_in_value_changed(value: float) -> void:
	Settings.DAS = int(value)
	# changes DAS 1-20
	pass 


func _on_arr_in_value_changed(value: float) -> void:
	Settings.ARR = int(value)
	# changes ARR 1-10
	pass 


func _on_debug_mode_in_toggled(toggled_on: bool) -> void:
	Settings.dm = toggled_on
	pass # Replace with function body.
