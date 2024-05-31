extends PlayerState
class_name RunLeftState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.flip_h = true
	animated_sprite.play("run-right")
