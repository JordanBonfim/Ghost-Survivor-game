extends CharacterBody2D






#region PLAYER STATS
var hp: float = 20:
	set(value):
		hp = clampf(value, 0, max_hp) 
		Messages.player_health_changed.emit(hp, max_hp)
		
var max_hp:float = 20 :
	#Heal player every time health increases??? Think.
	set(value):
		max_hp = value 
		Messages.player_health_changed.emit(hp, max_hp)
	
const SPEED = 300.0

#endregion


func _ready() -> void:
	$AnimatedSprite2D.play("idle_main")

func _unhandled_input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_MINUS:
			if Input.is_key_pressed(KEY_SHIFT):
				max_hp-=10
			else:
				print("LIFE:", hp)
				hp-=2
		elif event.keycode == KEY_EQUAL:
			if Input.is_key_pressed(KEY_SHIFT):
				max_hp+=10
			else:
				print("LIFE:", hp)
				hp+=2
		
	
	#if event is InputEventMouseButton and event.pressed:
		#print("Clicked at:", event.position)
		#print("mouse position:", get_local_mouse_position())
		
	
		
	
func _physics_process(delta: float) -> void:
	
	# Handle jump.a
	#if Input.is_action_just_pressed("ui_accept") :
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	
	
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
	
	
	
