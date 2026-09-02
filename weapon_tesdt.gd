extends AnimatedSprite2D


@export var ready_to_fire = false
@export var fire_delay = 1

var mouse_position = Vector2.ZERO
var right_x_position: float

func _ready() -> void:
	right_x_position = position.x

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot()


func shoot() -> void:
	if not ready_to_fire:
		return
		
	#var particle = Shot
		
func _physics_process(_delta: float) -> void:
	
	
	
	var mouse_global = get_global_mouse_position()
	look_at(mouse_global)
	
	var screen_mouse_position = get_viewport().get_mouse_position()
	
	var screen_middle_x = get_viewport_rect().size.x / 2
	
	if screen_mouse_position.x < screen_middle_x:
		flip_v = true
		position.x = -abs(right_x_position)
	else:
		flip_v = false
		position.x = abs(right_x_position)
