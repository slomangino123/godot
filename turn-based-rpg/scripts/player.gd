extends CharacterBody2D

func _physics_process(delta):
	handleMovement()
	handleInteraction()

#################### Movement ####################
@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 120.0

func handleMovement():
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
	move_and_slide()
	
	
#################### Interactions ####################
@onready var interactions = []
@onready var interactLabel = $"interaction-components/InteractionLabel"
@onready var interacting = false

func _on_interactionarea_area_entered(area):
	interactions.push_front(area)
	update_interactions()


func _on_interactionarea_area_exited(area):
	interactions.erase(area)
	DialogManager.onInteractionAreaExited()
	update_interactions()

func update_interactions():		
	if interactions:
		interactLabel.text = interactions[0].interact_label
	else:
		interactLabel.text = ""
	
func interact():
	if interactions:
		var currentInteraction = interactions[0]
		match currentInteraction.interact_type:
			"display_text":
				DialogManager.startDialog(global_position, currentInteraction.interact_value)

func handleInteraction():
	if Input.is_action_just_pressed("interact"):
		interacting = true
		interactLabel.text = ""
		interact()
	else:
		interacting = false
	
