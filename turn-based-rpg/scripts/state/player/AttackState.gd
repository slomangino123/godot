extends PlayerState
class_name AttackState

signal Attacking

@onready var animated_sprite = $"../../AnimatedSprite2D"

var isAttacking: bool = false
var previousState: State

func Enter(previous: State):
	Attacking.emit(true)
	previousState = previous
	isAttacking = true
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	#if direction.y < 0:
		#animated_sprite.play("attack-up")
	#elif direction.y > 0:
		#animated_sprite.play("attack-down")
	#else:
		#animated_sprite.play("attack-right")
		
		
	match previousState.name:
		"RunUpState", "PlayerIdleUpState":
			animated_sprite.play("attack-up")
		"RunDownState", "PlayerIdleDownState":
			animated_sprite.play("attack-down")
		"RunRightState", "PlayerIdleRightState":
			animated_sprite.play("attack-right")
		"RunLeftState", "PlayerIdleLeftState":
			animated_sprite.play("attack-right")

func PhysicsUpdate(delta):
	if isAttacking:
		return
	
	super.PhysicsUpdate(delta)

func _on_animated_sprite_2d_animation_finished():
	Attacking.emit(false)
	isAttacking = false
	match previousState.name:
		"RunUpState":
			Transitioned.emit(self, "PlayerIdleUpState")
		"RunDownState":
			Transitioned.emit(self, "PlayerIdleDownState")
		"RunRightState":
			Transitioned.emit(self, "PlayerIdleRightState")
		"RunLeftState":
			Transitioned.emit(self, "PlayerIdleLeftState")
		_:
			Transitioned.emit(self, previousState.name)
