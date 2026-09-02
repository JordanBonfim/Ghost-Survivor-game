extends RichTextLabel


var mouse_position = get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_fit_content(true)
	self.set_autowrap_mode(TextServer.AUTOWRAP_OFF)
	self.bbcode_enabled = true
	self.position = Vector2(100, 200)
	self.set_text("[b]Bold Text[/b] and\n[i]Italic Text[/i]")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
