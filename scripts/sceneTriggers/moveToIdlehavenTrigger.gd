extends Area2D


var entered = false

func _on_body_entered(body: PhysicsBody2D):
	if body.name == "Sheep":
		if !GlobalVariables.idlehavenCutscenePlayed:
			MusicPlayer.play_song("idlehavenMusic")
			Dialogic.start("IdlehavenCutscene")
		else:
			entered = true


func _process(delta):
	if entered:
		if !GlobalVariables.idlehavenBattleWon:
			get_tree().change_scene_to_file("res://scenes/bossArenas/idlehavenBossArena.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/idlehavenRestored.tscn")
