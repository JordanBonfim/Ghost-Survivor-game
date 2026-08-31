extends AnimatedSprite2D

@export var mouse_position = get_global_mouse_position()

func _physics_process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
