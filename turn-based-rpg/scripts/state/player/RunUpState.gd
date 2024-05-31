extends PlayerState
class_name RunUpState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.play("run-up")
