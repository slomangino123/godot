extends CharacterBody2D

@onready var stateMachine = $StateMachine

func _physics_process(delta):
	handleMovement()
	handleInteraction()

#################### Movement ####################
@onready var animated_sprite = $AnimatedSprite2D
const SPEED = 120.0
@onready var attacking = false

func handleMovement():
	if attacking:
		return
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = direction * SPEED
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


func _on_attack_state_attacking(isAttacking: bool):
	attacking = isAttacking
