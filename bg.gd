extends Panel
var step = 0
var offset = 0
@onready var player = $"../Player"
@onready var cam = $"../Player/Cam"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	step = (cam.limit_right - 180) / (size.x / 2 - 180)
	offset = player.position.x / step
	
	if player.position.x - 180 <= cam.limit_left:
		position.x = cam.limit_left
	elif player.position.x + 180 >= cam.limit_right:
		position.x = cam.limit_right - size.x
	else:
		position.x = player.position.x - size.x / 2 - offset
	pass
