extends Node2D

@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var fadeAnim = $FadeLayer/AnimationPlayer

func _ready():
	pauseMenu.hide()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)