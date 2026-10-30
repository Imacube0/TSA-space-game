extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Settings.dm:
		$"Debug text".visible_ratio = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"Debug text".text = str($"Player".rope_mode)
	$"Debug text".position.x = $"Player".position.x
	pass
