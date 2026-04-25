extends Character

func _init():
	id = "dk_drone"
	
	npcLevel = 5
	npcBasePain = 120
	npcBaseLust = 20
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="EmptySkin"
	pickedSkinRColor=Color("ff2B1F0C")
	pickedSkinGColor=Color("ff2B1F0C")
	pickedSkinBColor=Color("ff2B1F0C")
	
	npcPersonality = {
		PersonalityStat.Brat: -1,
		PersonalityStat.Mean: 0,
		PersonalityStat.Subby: 1,
		PersonalityStat.Impatient: -1,
		PersonalityStat.Naive: 1,
		PersonalityStat.Coward: 1,
	}
	
	npcDefaultFetishInterest = FetishInterest.Neutral
	
func _getName():
	return "Drone ID 7836"

func getGender():
	return Gender.Other
	
func getChatColor():
	return "#E866f4"
	
func getSmallDescription() -> String:
	return "A drone unit that seems friendly enough to you. You can\'t tell what it was before it was a drone"

func getSpecies():
	return ["drone"]
	
func _getAttacks():
	return ["simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 25

func getFemininity() -> int:
	return 30

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("dragontail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	
func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar"]
