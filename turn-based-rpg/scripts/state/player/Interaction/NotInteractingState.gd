extends State
class_name NotInteractingState

@export var interactions = []

func PhysicsUpdate(delta):
	if Input.is_action_just_pressed("interact"):
		Transitioned.emit(self, "InteractingState")
