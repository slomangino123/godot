extends PlayerState
class_name RunDownState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.play("run-down")
