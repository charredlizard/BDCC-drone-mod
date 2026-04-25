extends ItemBase

var nulledBodyPart: String = "penis"

func _init():
	id = "DK_NullBulge"

func getVisibleName():
	return "Null Bulge"
	
func getDescription():
	return "A goopy black mass that attaches to the wearer\'s genitals and prevents orgasm"

func getClothingSlot():
	var slot = InventorySlot.Anal
	if (nulledBodyPart == "penis"):
		slot = InventorySlot.Penis
	elif (nulledBodyPart == "vagina"):
		slot = InventorySlot.Vagina
	return slot

func getRequiredBodypart():
	var slot = BodypartSlot.Anus
	if (nulledBodyPart == "penis"):
		slot = BodypartSlot.Penis
	elif (nulledBodyPart == "vagina"):
		slot = BodypartSlot.Vagina
	return slot

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"
	
func getBuffs():
	return [
		buff(Buff.ChastityPenisBuff),
		buff(Buff.SensitivityGainBuff, [25.0]),
		]
	
func getPossibleActions():
	return [{
		"name": "Genitalia",
		"scene": "DK_NullBulgeSelection",
		"description": "Select which genitalia the null bulge will make useless."
	}]

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
	restraintData = load("res://Modules/DroneKinkModule/Items/Restraints/RestraintBulge.gd").new()
	restraintData.setLevel(7)
	
func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced over your genitals."
	else:
		return getAStackNameCapitalize()+" was forced over {receiver.nameS} genitals!"

func saveData():
	var data = .saveData()
	data["nulledBodyPart"] = nulledBodyPart
	return data
	
func loadData(_data):
	.loadData(_data)
	nulledBodyPart = SAVE.loadVar(_data, "nulledBodyPart", "")

func getUnriggedParts(_character):
	return {
		"chastity_cage": ["res://Modules/DroneKinkModule/Items/Models/DK_NullBulge.tscn"],
	}

func getHidesParts(_character):
	var parts = {}
	if(nulledBodyPart=="penis"):
		parts[BodypartSlot.Penis] = true
	return parts

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Penis) || _doll.isForcedExposed(BodypartSlot.Penis)):
		return true
	return false

func getInventoryImage():
	return "res://Modules/DroneKinkModule/Items/Images/Icons/DK_NullBulge.png"

func getAIForceItemWeight(_whoForcesNpc, _targetNpc):
	if(_whoForcesNpc == null):
		return 0.0
	var hypnosisValue = _whoForcesNpc.getFetishHolder().getFetishValue(Fetish.HypnosisHypnotist)
	return hypnosisValue * 1.0
