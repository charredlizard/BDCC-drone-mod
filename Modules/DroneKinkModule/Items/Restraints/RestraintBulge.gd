extends RestraintData
class_name RestraintBulge

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = RestraintType.ChastityCage
	sexReaction = SexReaction.BondageChastityCage

func canUnlockWithKey():
	return false

func canInspectWhileBlindfolded():
	return true

func getRemoveMessage():
	return "{user.name} rips off the "+getItem().getVisibleName()+" with a satisfying squelch!"

func shouldDoStruggleMinigame(_pc):
	if(_pc.hasBlockedHands() && _pc.hasBoundArms()):
		return false
	return true

func doStruggle(_pc, _minigame:MinigameResult):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	if(_handsFree && _armsFree):
		if(failChanceLowScore(_pc, 15, _minigame)):
			text = "{user.nameS} struggling only makes the "+getItem().getVisibleName()+" [b]hold on tighter![/b]"
			damage = -0.5
		else:
			text = "{user.name} grabs and pulls on the "+getItem().getVisibleName()+", trying to take it off."
			damage = calcDamage(_pc, _minigame, 0.9)
			stamina = 10
	elif(!_handsFree):
		text = "{user.name} tries to pull the "+getItem().getVisibleName()+" off, but {user.his} bound hands [b]can\'t get a grip and slip uselessly[/b] over it."
		damage = calcDamage(_pc, _minigame, 0.1)
		stamina = 2
	else:
		text = "{user.name} is bound so tightly, {user.he} makes absolutely no progress!"
	
	if(failChance(_pc, 30)):
		text += " The "+getItem().getVisibleName()+" stimulates {user.his} useless genitals, making {user.him} quite aroused."
		lust = scaleDamage(5)
	elif(failChance(_pc, 10)):
		text += " The irritated "+getItem().getVisibleName()+" pulses strongly against {user.his} nulled genitals, making {user.him} [b]very horny![/b]"
		lust = scaleDamage(12)
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

