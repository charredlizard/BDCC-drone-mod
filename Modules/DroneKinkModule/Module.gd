extends Module

func getFlags():
	return {
		"PCisInterested": flag(FlagType.Bool),
		"PCisConverted": flag(FlagType.Bool),
		"PCdroneGoal": flag(FlagType.Number),
		
		"Drone_Self_Number": flag(FlagType.Number),
		
		"Drone_TalkedAbout_Introduction": flag(FlagType.Bool),		
		"Drone_TalkedAbout_WhoIs": flag(FlagType.Bool),
		"Drone_TalkedAbout_WhatIs": flag(FlagType.Bool),
		"Drone_TalkedAbout_Convert": flag(FlagType.Bool),
	}

func _init():
	id = "DroneKinkModule"
	author = "charredlizard"
	
	attacks = [
#		"res://Modules/DroneKinkModule/Attacks/DK_ForceVisor.gd",
#
#		"res://Modules/DroneKinkModule/Attacks/DK_CommandPleasure.gd",
#		"res://Modules/DroneKinkModule/Attacks/DK_CommandStun.gd",
	]
	scenes = [
		"res://Modules/DroneKinkModule/Scenes/DK_Drone_Introduction.gd",
		"res://Modules/DroneKinkModule/Scenes/DK_BulgeSelection.gd",
	]
	characters = [
		"res://Modules/DroneKinkModule/Characters/DK_Drone.gd",
	]
	species = [
		"res://Modules/DroneKinkModule/Species/DK_DroneSpecies.gd",
	]
	items = [
#		"res://Modules/DroneKinkModule/Items/Visors/DK_DroneVisor.gd",
#		"res://Modules/DroneKinkModule/Items/Visors/DK_DroneVisorToy.gd",
#		"res://Modules/DroneKinkModule/Items/Visors/DK_DroneVisorNull.gd",
#		"res://Modules/DroneKinkModule/Items/Visors/DK_DroneVisorMilk.gd",
#
#		"res://Modules/DroneKinkModule/Items/Suits/DK_DroneSuit.gd",
#		"res://Modules/DroneKinkModule/Items/Suits/DK_DroneToysuit.gd",
#		"res://Modules/DroneKinkModule/Items/Suits/DK_DroneNullsuit.gd",
#		"res://Modules/DroneKinkModule/Items/Suits/DK_DroneMilksuit.gd",
#
#		"res://Modules/DroneKinkModule/Items/BDSM/DK_DroneStraitjacket.gd",
#		"res://Modules/DroneKinkModule/Items/BDSM/DK_DroneGag.gd",
#
		"res://Modules/DroneKinkModule/Items/Toys/DK_NullBulge.gd",
#		"res://Modules/DroneKinkModule/Items/Toys/DK_PleasureBulge.gd",
	]
	events = [
#		"res://Modules/DroneKinkModule/Events/DK_AlexDealEvent.gd",
	]
	quests = [
#		"res://Modules/DroneKinkModule/Quests/DK_DroneArmy.gd",
#		"res://Modules/DroneKinkModule/Quests/DK_DroneHarem.gd",
#		"res://Modules/DroneKinkModule/Quests/DK_DroneFarm.gd",
	]
	fetishes = [
#		"res://Modules/DroneKinkModule/SexEngine/Fetish/DK_DronificationTop.gd",
#		"res://Modules/DroneKinkModule/SexEngine/Fetish/DK_DronificationBottom.gd",
	]
	sexGoals = [
#		"res://Modules/DroneKinkModule/SexEngine/Goals/DK_Dronify.gd",
	]
	stageScenes = [
#		"res://Modules/DroneKinkModule/Animations/HK_ArmsRaisedDuo.tscn",
	]
	speechModifiers = [
#		"res://Modules/DroneKinkModule/Speech/DK_DroneSpeech.gd"
	]
