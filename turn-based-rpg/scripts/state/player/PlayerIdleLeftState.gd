extends PlayerState
class_name PlayerIdleLeftState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.flip_h = true
	animated_sprite.play("idle-side")
