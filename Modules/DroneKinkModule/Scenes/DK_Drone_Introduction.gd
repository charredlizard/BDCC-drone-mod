extends SceneBase

func _init():
	sceneID = "DK_Drone_Introduction"

func _run():
	if(state==""):
		addCharacter("dk_drone")
		playAnimation(StageScene.Duo, "stand", {npc="dk_drone"})
		
		saynn("[say=dk_drone]Hello world. {dk_drone.name} greets you.[/say]")
		addButton("Give Number","Have a cool number!","giveNumber")
		addButton("Okay","Nice to meet you!","end")
	if(state=="numberGiven"):
		saynn("[say=dk_drone]Thank you! {dk_drone.nameS} number is now " + str(getFlag("DroneKinkModule.Drone_Self_Number")) + "[/say]")
		addButton("Okay","Nice to meet you!","end")
	return

func _react(_action: String, _args):
	if(_action == "end"):
		endScene()
	if(_action == "giveNumber"):
		var number = (randi() % 9000 + 1000)
		setFlag("DroneKinkModule.Drone_Self_Number", number)
		setState("numberGiven")
	return
