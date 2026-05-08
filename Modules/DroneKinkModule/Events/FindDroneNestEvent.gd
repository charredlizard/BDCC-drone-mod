extends EventBase

func _init():
	id = "FindDroneNestEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringRoom, "fight_corner_sw")

func run(_triggerID, _args):
	saynn("You notice a suspicious vent on the wall.")
	
	if(!getFlag("DroneKinkModule.PChasMet")):
		addButton("Vent", "Enter the vent", "investigate")
	else:
		addButton("Vent", "Enter the drone nest", "enterNest")

func getPriority():
	return 2

func onButton(_method, _args):
	if(_method == "investigate"):
		runScene("DK_Drone_Introduction")
	if(_method == "enterNest"):
		GM.pc.setLocation("tunnel_enter")
		GM.main.reRun()
