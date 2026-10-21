extends Node2D

var offset = Vector2(40, 30)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Settings.dm:
		$"Debug text".visible_ratio = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"Debug text".text = str(str($"BG".size.x) + "\n" + str($"Player".position.x))
	$"Debug text".position.x = $"Player".position.x
	pass
