extends State
class_name PlayerState

func PhysicsUpdate(delta):
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "AttackState")
	elif Input.is_action_pressed("ui_up"):
		Transitioned.emit(self, "RunUpState")
	elif Input.is_action_pressed("ui_right"):
		Transitioned.emit(self, "RunRightState")
	elif Input.is_action_pressed("ui_down"):
		Transitioned.emit(self, "RunDownState")
	elif Input.is_action_pressed("ui_left"):
		Transitioned.emit(self, "RunLeftState")
	elif Input.is_action_just_released("ui_up"):
		Transitioned.emit(self, "PlayerIdleUpState")
	elif Input.is_action_just_released("ui_right"):
		Transitioned.emit(self, "PlayerIdleRightState")
	elif Input.is_action_just_released("ui_down"):
		Transitioned.emit(self, "PlayerIdleDownState")
	elif Input.is_action_just_released("ui_left"):
		Transitioned.emit(self, "PlayerIdleLeftState")

