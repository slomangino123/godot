extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 120.0

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

	velocity = direction * SPEED
	
	# right x positive
	# left x negative
	# up y negative
	# down y positive
# RIGHT
	if Input.is_action_pressed("ui_right"):
		animated_sprite.flip_h = false
		animated_sprite.play("run-right")
	elif Input.is_action_just_released("ui_right"):
		animated_sprite.play("idle-side")
# LEFT
	elif Input.is_action_pressed("ui_left"):
		animated_sprite.flip_h = true
		animated_sprite.play("run-right")
	elif Input.is_action_just_released("ui_left"):
		animated_sprite.play("idle-side")
# DOWN
	elif Input.is_action_pressed("ui_up"):
		animated_sprite.play("run-up")
	elif Input.is_action_just_released("ui_up"):
		animated_sprite.play("idle-rear")
# UP
	elif Input.is_action_pressed("ui_down"):
		animated_sprite.play("run-down")
	elif Input.is_action_just_released("ui_down"):
		animated_sprite.play("idle")

	#if direction.x > 0:	
		#animated_sprite.flip_h = false
		#animated_sprite.play("run-right")
		#if direction.x == 0:
			#animated_sprite.play("idle-side")
	#elif velocity.x < 0:
		#animated_sprite.flip_h = true
		#animated_sprite.play("run-right")
		#if velocity.x > 0:
			#animated_sprite.play("idle-side")
	
	move_and_slide()
	
