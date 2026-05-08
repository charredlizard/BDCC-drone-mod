extends SubGameWorld

func _on_TunnelVent_onEnter(room):
	room.addButton("Vent", "Leave the drone nest", "vent")

func _on_TunnelVent_onReact(_room, key):
	if(key == "vent"):
		GM.pc.setLocation("fight_corner_sw")
		GM.main.reRun()

func _on_NestNE_onEnter(room):
	room.addButton("Vent", "Leave the drone nest", "vent")

func _on_NestNE_onReact(_room, key):
	if(key == "vent"):
		GM.pc.setLocation("fight_corner_sw")
		GM.main.reRun()
