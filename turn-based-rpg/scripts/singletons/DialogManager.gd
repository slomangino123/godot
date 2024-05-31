extends Node


@onready var dialogBoxScene = preload("res://scenes/DialogBox.tscn")

var dialogLines: Array[String] = []

var currentLineIndex = 0

var textBox
var textBoxPosition: Vector2

var isDialogActive = false
var canAdvanceLine = false

func startDialog(position: Vector2, lines: Array[String]):
	if isDialogActive:
		return
		
	dialogLines = lines
	textBoxPosition = position
	showTextBox()
	
	isDialogActive = true
	
func showTextBox():
	textBox = dialogBoxScene.instantiate()
	textBox.finished_displaying.connect(onTextBoxFinishedDisplaying)
	get_tree().root.add_child(textBox)
	textBox.global_position = textBoxPosition
	textBox.displayText(dialogLines[currentLineIndex])
	canAdvanceLine = false
	
func onTextBoxFinishedDisplaying():
	canAdvanceLine = true
	
func onInteractionAreaExited():
	if textBox != null:
		isDialogActive = false
		textBox.queue_free()
	
func _unhandled_input(event):
	if (
		event.is_action_pressed("interact") &&
		isDialogActive &&
		canAdvanceLine
		):
			textBox.queue_free()
			currentLineIndex += 1
			if currentLineIndex >= dialogLines.size():
				isDialogActive = false
				currentLineIndex = 0
				return
			
			showTextBox()
