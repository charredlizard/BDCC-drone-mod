extends SceneBase

var uniqueItemID = ""

func _init():
	sceneID = "DK_BulgeSelection"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _run():
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	if(state==""):
		saynn("{pc.You} pull out the "+item.getVisibleName()+" and take a good look at it. Little droplets of goo trickle down its surface. It oozes through the gaps in {pc.your} fingers, but {pc.you} don\'t notice any droplets on the floor. "+RNG.pick(["{pc.You} have no idea how it holds its shape.","{pc.You} could swear it almost seems sentient.","{pc.You} wonder what it\'s made of."]))
		saynn("{pc.You} think {pc.you} can change what it will cover during sex.")
		saynn("Right now, "+item.getCoveredBodyPartsStringWordy(false))
		addButton("Done","That looks good","end")
		for part in item.coveredBodyParts.keys():
			addButton(part.capitalize(),"Toggle this body part","toggle", part)
	if(state=="toggle"):
		saynn("{pc.You}"+RNG.pick([" mess with"," poke at"," knead"])+" the "+item.getVisibleName()+RNG.pick([" a little."," for a bit."," until it looks right."])+" A bit of goo sticks to your fingers, but it quickly becomes inert and drips harmessly onto the floor.")
		addButton("Continue","","")
	if(state=="itsNoUse"):
		saynn("IT\'S NO USE!!!")
		addButton("Okay","Take This","end")
	return

func _react(_action: String, _args):
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	
	if(_action == "end"):
		endScene()
	if(_action == "toggle"):
		var part = _args
		item.coveredBodyParts[part] = !item.coveredBodyParts[part]
		addMessage("The "+part+" will be "+("free " if !item.coveredBodyParts[part] else "covered ")+"during sex.")
	
	setState(_action)
	return

func saveData():
	var data = .saveData()
	
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
