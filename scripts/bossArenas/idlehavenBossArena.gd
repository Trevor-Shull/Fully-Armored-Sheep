extends Node2D

@onready var sheepAnim = $Sheep/AnimationPlayer
@onready var fadeAnim = $FadeLayer/AnimationPlayer
@onready var pauseMenu = $Sheep/Camera2D/menuLayer/pauseMenu
@onready var pauseOptionsMenu = $Sheep/Camera2D/menuLayer/pauseOptionsMenu
@onready var leaveMenu = $Sheep/Camera2D/menuLayer/leaveMenu
var battleWon = false


func _ready():
	GlobalVariables.current_scene = get_tree().current_scene.scene_file_path
	GlobalVariables.pauseOptionsPressed.connect(openPauseOptions)
	GlobalVariables.pauseOptionsBackPressed.connect(closePauseOptions)
	GlobalVariables.SGBattleWon.connect(playShoesCutscene)
	GlobalVariables.player_can_move = true
	GlobalVariables.characters_can_move = true
	pauseMenu.hide()
	pauseOptionsMenu.hide()
	leaveMenu.hide()
	fadeAnim.play("fadeIn")
	sheepAnim.play("right")
	if GlobalVariables.current_song != "idlehavenBattleMusic":
		MusicPlayer.play_song("idlehavenBattleMusic")


func openPauseOptions():
	if pauseMenu.is_visible_in_tree():
		pauseMenu.hide()
		pauseOptionsMenu.show()


func closePauseOptions():
	if pauseOptionsMenu.is_visible_in_tree():
		pauseOptionsMenu.hide()
		pauseMenu.show()


func openLeaveMenu():
	leaveMenu.show()


func closeLeaveMenu():
	leaveMenu.hide()


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		GlobalVariables.pause(pauseMenu)

func playShoesCutscene():
	GlobalVariables.slothAlive = true
	GlobalVariables.gluttonyAlive = true
	MusicPlayer.play_song("victoryMusic")
	await get_tree().create_timer(7.11).timeout #length of victory music
	MusicPlayer.play_song("idlehavenRestored")
	Dialogic.start("shoesCutscene")
