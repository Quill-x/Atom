extends Label

var fun_facts = ["Super Duper Ultra Epic Fun Fact: 
	
So many elements were discovered in Berkeley in a row that they named an element after themseleves!",
"Super Duper Ultra Epic Fun Fact: 
	
Americium, one of the man-made elements is used in smoke alarms! It makes the air inside the detector conduct electricity, and smoke blocks that conductivity.",
"Super Duper Ultra Epic Fun Fact: 
	
Albert Ghiorso, co-discoverer of twelve elements, supposedly held the world record for the longest ham radio. He was able to pick up radio from Ohio all the way in California.",
"Super Duper Ultra Epic Fun Fact: 
	
Victor Ninov, co-discoverer of three elements and a Bulgarian, liked going around to every Italian restaurant in a German city and ranking their Spaghetti Carbonara.",
"Super Duper Ultra Epic Fun Fact: 
	
Not all man-made elements were created in labs; some were produced during the explosions of nuclear bombs!",
"Super Duper Ultra Epic Fun Fact: 

When Glenn Seaborg was tasked with creating plutonium to fuel an atomic bomb during the Manhattan Project, a beaker fell over, and half the world's supply of plutonium was absorbed into a newspaper.",
"Super Duper Ultra Epic UnFun Fact:

The \"Lawrence\" referred to throughout the dialogue of this game is Ernest Lawrence, the inventor of the cyclotron!",
"Super Duper Ultra Epic UnFun Fact: 

Cyclotrons are used instead of the normal particle accelerators, as the normal ones are way too strong for creating new elements. All the targets will end up like Adam (from the opening cutscene) if they are used.",
"Super Duper Ultra Epic UnFun Fact: 

Cyclotrons are particle accelerators that spin particles in a spiral path within a circle. These are usually way smaller than most particle accelerators."
]
func _process(delta):
	if GlobalTimer.time > 420-15:
		text = ""
	if GlobalTimer.time < 420-15:
		text = fun_facts[floor(GlobalTimer.time/45)] + "
		
		New Fun Fact in " + str(floor(fmod(GlobalTimer.time,45))) + " seconds."
