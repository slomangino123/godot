extends StaticBody2D

@onready var label = $Label

func _ready():
	label.text = ""

func _on_area_2d_body_entered(body):
	label.text = "F TO INTERACT"
	


func _on_area_2d_body_exited(body):
	label.text = ""
