extends SexReactionHandler

func _init():
	handles = {
		DK_SexReaction.BondageNullBulge: {REACT_CHANCE: 100},
	}

func getLines(_reaction:int, _role:int, _args:Array):
	match(_reaction):
		DK_SexReaction.BondageNullBulge:
			if(_role == ROLE_MAIN):
				if(isAngry()):
					addLines([
						"Look at it. So "+RNG.pick(["smooth", "shiny"])+" and useless.",
						"Say goodbye to your genitals, "+RNG.pick(["slut","whore","bitch"])+".",
						"I like you better this way.",
						"No more cumming for you, "+RNG.pick(["slut","whore","bitch"])+".",
						"If you were a good "+RNG.pick(["slut","whore","bitch"])+", maybe you would still have your genitals.",
						"Beg for release and I might [i]consider[/i] taking it off.",
					])
				if(!isAngry()):
					addLines([
						"Look at you. So "+RNG.pick(["smooth", "shiny"])+" and perfect.",
						"Cumming is overrated, anyways.",
						"I love the "+RNG.pick(["noises you make", "face you make", "way you beg"])+" when I "+RNG.pick(["tease", "edge", "deny"])+" you.",
						"Let\'s do some "+RNG.pick(["teasing", "edging", "denial play"])+".",
						"Don\'t worry, it comes off."
					])


