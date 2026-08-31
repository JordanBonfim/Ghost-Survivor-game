extends CharacterBody2D

const SPEED = 300.0

@onready var anim = $AnimatedSprite2D

# animação padrão
var animacao_idle = "idle_main"

func _physics_process(delta: float) -> void:
	
	# --- TROCA DE ARMAS ---
	if Input.is_physical_key_pressed(KEY_2):
		animacao_idle = "idle_shotgun"
		
	if Input.is_physical_key_pressed(KEY_1):
		animacao_idle = "idle_main"

   # Movimentação
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * SPEED
		
		
		anim.play("run")
		

		if direction.x < 0:
			anim.flip_h = true 
		elif direction.x > 0:
			anim.flip_h = false 
			
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		anim.play(animacao_idle)

	move_and_slide()
