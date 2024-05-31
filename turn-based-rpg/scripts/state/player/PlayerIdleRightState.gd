extends PlayerState
class_name PlayerIdleRightState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.flip_h = false
	animated_sprite.play("idle-side")
