extends SceneBase

func _init():
	sceneID = "DK_Drone_Introduction"

func _run():
	if(state==""):
		saynn("You enter the vent...")
		addContinue("entering")
	if(state=="entered"):
		aimCameraAndSetLocName("tunnel_enter")
#		setFlag("DroneKinkModule.PChasMet", true)
		addCharacter("dk_drone")
		playAnimation(StageScene.Duo, "stand", {npc="dk_drone"})
		
		saynn("[say=dk_drone]Hello world. {dk_drone.name} greets you.[/say]")
		addButton("Give Number","Have a cool number!","giveNumber")
		addButton("Okay","Nice to meet you!","end")
	if(state=="numberGiven"):
		aimCameraAndSetLocName("tunnel_2")
		
		saynn("[say=dk_drone]Thank you! {dk_drone.nameS} number is now " + str(getFlag("DroneKinkModule.Drone_Self_Number")) + "[/say]")
		addButton("Okay","Nice to meet you!","end")
	return

func _react(_action: String, _args):
	if(_action == "entering"):
		# add darkness effect
		GM.pc.addTimedBuff(GlobalRegistry.createBuff(Buff.BlindfoldBuff), 0)
		
		setState("entered")
	if(_action == "giveNumber"):
		var number = (randi() % 9000 + 1000)
		setFlag("DroneKinkModule.Drone_Self_Number", number)
		setState("numberGiven")
	if(_action == "end"):
		playAnimation(StageScene.Solo, "stand")
		#remove darkness effect
		for key in GM.pc.timedBuffs:
			if (key[0].id == Buff.BlindfoldBuff):
				GM.pc.timedBuffs.erase(key)
		endScene()
	return
