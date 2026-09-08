extends CharacterBody2D

const speed = 100.0

@onready var target = $"../Player"
var last_position = position

var direction = 0
var is_facing_left:bool = false
var is_hitting_player:bool = false

func _ready() -> void:
	$AnimationPlayer.play("walk")

func _physics_process(delta: float) -> void:
		
	if $AnimationPlayer.current_animation == "Punch":
		return
	
	if $AnimationPlayer.current_animation == "walk":
		if abs(target.position.x - position.x) > 5:
			direction = (target.position - position).normalized()
			
	#		if im looking to the left and target is on the right side
			if target.position.x > position.x && is_facing_left:
				scale.x = -scale.x
				is_facing_left = false
	#		if im looking to the right and target is on the left side
			elif target.position.x < position.x && not is_facing_left:
				scale.x = -scale.x
				is_facing_left = true

		velocity = direction * speed
		move_and_slide()
		

func hit() -> void:
	$AttackDetector.monitoring = true
	
func end_of_hit() -> void:
	$AttackDetector.monitoring = false

func walk () -> void :	
	$AnimationPlayer.play("walk")
	

func _on_player_detector_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("punch")
	is_hitting_player


func _on_attack_detector_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
