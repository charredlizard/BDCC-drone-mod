extends ItemBase

var coveredBodyParts: Dictionary = {"penis": true, "vagina": false, "anus": false}

func _init():
	id = "DK_NullBulge"

func getVisibleName():
	return "Null Bulge"
	
func getDescription():
	return "A goopy black mass that attaches to the wearer\'s genitals and prevents orgasm. "+getCoveredBodyPartsStringWordy(true)

func getClothingSlot():
	var slot = InventorySlot.Anal
	if (coveredBodyParts["vagina"] == true):
		slot = InventorySlot.Vagina
	elif (coveredBodyParts["penis"] == true):
		slot = InventorySlot.Penis
	return slot

func getRequiredBodypart():
	var slot = BodypartSlot.Anus
	if (coveredBodyParts["vagina"] == true):
		slot = BodypartSlot.Vagina
	elif (coveredBodyParts["penis"] == true):
		slot = BodypartSlot.Penis
	return slot

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"
	
func getBuffs():
	var buffList = [buff(Buff.SensitivityGainBuff, [25.0])]
	
	if(coveredBodyParts["anus"]):
		buffList.push_front(buff(Buff.ChastityAnusBuff))
	if(coveredBodyParts["vagina"]):
		buffList.push_front(buff(Buff.ChastityVaginaBuff))
	if(coveredBodyParts["penis"]):
		buffList.push_front(buff(Buff.ChastityPenisBuff))
	
	return buffList
	
func getPossibleActions():
	if(!isWornByWearer()):
		return [{
			"name": "Configure",
			"scene": "DK_BulgeSelection",
			"description": "Select which genitalia the null bulge will make useless."
		}]
	return []

func getPrice():
	return 30

func getStackPrice():
	return int(getPrice() * (1.0 + 0.8 * (amount - 1.0)))

func getSellPrice():
	return int(getPrice() / 1.5 / getBuyAmount())

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.ChastityCage, ItemTag.Illegal, ItemTag.SoldByUnderwearVendomat]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = load("res://Modules/DroneKinkModule/Items/RestraintBulge.gd").new()
	restraintData.setLevel(7)
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over {pc.your} genitals!" + ((" It quickly spreads to cover {pc.your} "+getCoveredBodyPartsString()+".") if hasCovered() else "")
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} genitals." + ((" It quickly spreads to cover their "+getCoveredBodyPartsString()+".") if hasCovered() else "")

func saveData():
	var data = .saveData()
	data["coveredBodyParts"] = coveredBodyParts
	return data
	
func loadData(_data):
	.loadData(_data)
	coveredBodyParts = SAVE.loadVar(_data, "coveredBodyParts", "")

func getUnriggedParts(_character):
	return {
		"bulge": ["res://Modules/DroneKinkModule/Items/Toys/DK_NullBulge.tscn"],
	}

func getHidesParts(_character):
	var parts = {}
	if(coveredBodyParts["penis"]==true):
		parts[BodypartSlot.Penis] = true
	return parts

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Penis) || _doll.isForcedExposed(BodypartSlot.Penis)):
		return true
	return false

func getInventoryImage():
	return "res://Modules/DroneKinkModule/Items/Images/Icons/NulgeIcon.png"

func getAIForceItemWeight(_whoForcesNpc, _targetNpc):
	if(_whoForcesNpc == null):
		return 0.0
	var hypnosisValue = _whoForcesNpc.getFetishHolder().getFetishValue(Fetish.HypnosisHypnotist)
	return hypnosisValue * 1.0

func getCoveredBodyParts():
	var partsArray: Array = []
	
	for part in coveredBodyParts.keys(): # adds each nulled body part to an array 
		if(coveredBodyParts[part]):
			partsArray.append(part)
	
	return partsArray

func getCoveredBodyPartsString(capitalize: bool = true):
	var partsArray: Array = []
	
	for part in coveredBodyParts.keys(): # adds each nulled body part to an array 
		if(coveredBodyParts[part]):
			partsArray.append(part)
	
	if(partsArray.size() > 2): # concatenates array of parts into a human readable phrase
		var part = partsArray
		return (part[0].capitalize() if capitalize else part[0])+", "+part[1]+", and "+part[2]
	if(partsArray.size() > 1):
		var part = partsArray
		return (part[0].capitalize() if capitalize else part[0])+" and "+part[1]
	if(partsArray.size() > 0):
		var part = partsArray
		return (part[0].capitalize() if capitalize else part[0])
	return null

func getCoveredBodyPartsStringWordy(capitalize: bool = true):
	var partsString: String = "It " if capitalize else "it "
	var partsArray: Array = []
	
	for part in coveredBodyParts.keys(): # adds each nulled body part to an array 
		if(coveredBodyParts[part]):
			partsArray.append(part)
	
	if(partsArray.size() > 2): # concatenates array of parts into a human readable phrase
		var part = partsArray
		partsString += "is configure to block the wearer\'s [b]"+part[0]+", "+part[1]+", and "+part[2]+"[/b] so they can\'t be used during sex."
	elif(partsArray.size() > 1):
		var part = partsArray
		partsString += "is configure to block the wearer\'s [b]"+part[0]+" and "+part[1]+"[/b] so they can\'t be used during sex."
	elif(partsArray.size() > 0):
		var part = partsArray
		partsString += "is configure to block the wearer\'s [b]"+part[0]+"[/b] so it can\'t be used during sex."
	else:
		partsString += "[i]won't[/i] block the wearer\'s genitals, but it will still be visible when worn."
	
	return partsString

func hasCovered():
	for part in coveredBodyParts:
		if part:
			return true
	return false

func isCovered(part: String = ""):
	if coveredBodyParts.has(part):
		if coveredBodyParts[part]:
			return true
	return false
