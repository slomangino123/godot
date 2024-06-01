extends State
class_name InteractingState

signal IsInteracting

func Enter(previous: State):
	IsInteracting.emit(true)
	
func Exit():
	IsInteracting.emit(false)
	
func PhysicsUpdate(delta):
	pass
