#Player hud
extends CanvasLayer

@onready var hp_margin_container: MarginContainer = $Control/HPMarginContainer
@onready var hp_bar: TextureProgressBar = $Control/HPMarginContainer/NinePatchRect/HPBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Messages.player_health_changed.connect(update_health_bar)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_health_bar(hp: float, max_hp: float) -> void:
	var value : float =(hp / max_hp) * 100
	hp_bar.value = value
	hp_margin_container.size.x = max_hp + 22
	pass
