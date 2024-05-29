extends CharacterBody2D


const SPEED = 120.0

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = direction * SPEED
	move_and_slide()
	
