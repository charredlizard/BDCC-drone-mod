extends Species

func _init():
	id = "drone"
	pass
	
func getVisibleName():
	return "Drone"
	
func getVisibleDescription():
	return "A nameless being whose only purpose is to serve their master"

func getDefaultLegs(_gender):
	return "digilegs"

func getDefaultBreasts(_gender):
	if(_gender in [Gender.Male]):
		return "malebreasts"
	
	return "humanbreasts"

func getDefaultHair(_gender):
	return "baldhair"
	
func getDefaultTail(_gender):
	return null

func getDefaultBody(_gender):
	return "anthrobody"

func getDefaultHead(_gender):
	return "humanhead"
	
func getDefaultArms(_gender):
	return "anthroarms"

func getDefaultEars(_gender):
	return "humanears"

func getDefaultHorns(_gender):
	return null

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous, Gender.Other]):
		return "dragonpenis"
	else:
		return null

func getDefaultVagina(_gender):
	if(_gender in [Gender.Female, Gender.Androgynous, Gender.Other]):
		return "vagina"
	else:
		return null

func getDefaultAnus(_gender):
	return "anus"

func isPlayable():
	return false

# [[amount, weight], [amount, weight]]
func getEggCellOvulationAmount():
	return [
		[0, 10.0],
		[1, 1.0],
		[2, 0.2],
	]

# How often is this species will show up in procedural encounters. 0 = never, 0-1 = less often, 1 = default chance, >1 = more often
func npcGenerationWeight():
	return 0.0

func canBeUsedForNPCType(_npcType):
	return false

func onDynamicNpcCreation(_npc, _args):
	_npc.pickedSkin = "EmptySkin"
	pass

# Disables ability to generate npcs of this species with a mane
func supportsMane():
	return false

func calculateScoreForSpeciesCalculations(_npc) -> float:
	return 1.0
