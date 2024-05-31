extends Node
class_name State

signal Transitioned

# Previous state included so that we can return to that state, like when attack animation is over
func Enter(previous: State):
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func PhysicsUpdate(_delta: float):
	pass
