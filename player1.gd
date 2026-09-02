extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var character_orientation = 0

func _ready() -> void:
	$AnimatedSprite2D.play("idle_main")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Clicked at:", event.position)
		print("mouse position:", get_local_mouse_position())
		
		# Handle click logic here   
		
func _physics_process(delta: float) -> void:
	
	# Handle jump.a
	if Input.is_action_just_pressed("ui_accept") :
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	
	#var last_orientation = character_orientation
	#if character_orientation == last_orientation:
		## Esquerda se orientatio for 0
		#$AnimatedSprite2D.flip_h = (x_direction < 0)
		
	$AnimatedSprite2D.flip_h = false
	if get_global_mouse_position().x < global_position.x:
		$AnimatedSprite2D.flip_h = true
			
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	
	move_and_slide()
