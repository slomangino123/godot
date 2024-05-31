extends PlayerState
class_name PlayerIdleUpState

@onready var animated_sprite = $"../../AnimatedSprite2D"

func Enter(previous: State):
	animated_sprite.play("idle-rear")
