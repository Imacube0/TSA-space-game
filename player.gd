extends CharacterBody2D


const SPEED = 160.0
const JUMP_VELOCITY = -350.0
var jump_buffer_time = 0.1
var jump_buffer_timer: float = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		# Starts jump buffer
		jump_buffer_timer = jump_buffer_time

func _process(delta: float) -> void:
	jump_buffer_timer -= delta

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y > 0:
			velocity += 1.6 * (get_gravity() * delta)
			# when falling, increase grav
		else:
			velocity += get_gravity() * delta
			
	# Handle jump.
	if is_on_floor() and (jump_buffer_timer > 0 or Input.is_action_just_pressed("jump")):
		velocity.y = JUMP_VELOCITY
			
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		set_scale(Vector2(direction, 1))
		rotation_degrees = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	# Animations
	if is_on_floor():
		if direction:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("jump")
	move_and_slide()
