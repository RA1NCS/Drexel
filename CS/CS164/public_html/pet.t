# SHREYAN GUPTA
# sg3778
# LAB 066

# WEBSITE LINK : https://www.cs.drexel.edu/~sg3778/pet.html
# DOCUMENTATION LINK : https://www.cs.drexel.edu/~sg3778/petDoc.html - IS ALSO INCLUDED IN MAIN WEBSITE!

var state, petImg, tim0, tim1, tim2, tim3, tim4

fun init() {

	# Initialization
	html(" <style>    body {background-color: #fff0a3;font-family: 'Montserrat';font-weight: 400;text-align: center;margin-top: 5%;}h1 {font-family: 'Smallest Pixel-7';font-size: 7rem;color: #223974;text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff, 1px 1px 0 #fff;letter-spacing: 0.1rem;}a {position: relative; margin-top: 50px;font-size: 1.5rem;font-weight: 700;color: rgb(35, 35, 35);text-decoration: none;}button {width: 5%;aspect-ratio: 3;font-family: 'Montserrat';background-color: #223974;margin: 4rem 2rem;border: none;color: #fff;transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;border-radius: 0.25rem;}button:hover {background-color: #304e9b;}button:active {background-color: #2b4586;}img {height: 300px;margin-left: auto;margin-right: auto;margin-top: -40px;}hr {margin-top: 4%;width: 8%;text-align: center;border: none;border-top: 1vh dotted #d2af00;} </style>")
	# Heading
	html("<h1> VMoji : Your Virtual Emoji </h1>")	

	# Pet Creation
        petImg : makeimg()
        setimg(.petImg, "petPics/5.png")

	html("<br>\n")

	# Button Creation
	button("Play", pet_play)
	button("Slap", pet_slap)
	button("Feed", pet_feed)
	button("Kill", pet_kill)
	button("Revive", pet_revive)

 	state : 5

	timerStart()

	# Documentation
	html("<hr></hr> <br> <a href='petDoc.html'>Learn more about your pet!</a>")
}

# button functions

fun pet_play() {

	resetTimer()
	
	if .state == 0 {
		state : 0
		render()
	}

	else {
		state : .state + 2
		stateCheck()
		render()
	}	

}

fun pet_slap() {

	resetTimer()

        if .state == 0 {
                state : 0
                render()
        }

        else {
                state : .state - 2
                stateCheck()
                render()
        }

}

fun pet_feed() {

	resetTimer()

        if .state == 0 {
                state : 0
                render()
        }

        else {
		state : .state + 1
                stateCheck()
                render()
        }

}

fun pet_kill() {
	resetTimer()

	state : 0
	render()
}

fun pet_revive() {
	resetTimer()

	state : 3
	render()
}

# state setting

fun render() {
	if .state == 0 {
            setimg(.petImg, "petPics/0.png")
        }
	
	else if .state == 1 {
            setimg(.petImg, "petPics/1.png")
        }

        else if .state == 2 {
             setimg(.petImg, "petPics/2.png")
        }

        else if .state == 3 {
            setimg(.petImg, "petPics/3.png")
        }

        else if .state == 4 {
            setimg(.petImg, "petPics/4.png")
        }

        else if .state == 5 {
            setimg(.petImg, "petPics/5.png")
        }
}

# state reduction

fun stateReduce() {
	state : .state - 1
	stateCheck()
	render()
}

# state limit check

fun stateCheck() {
	if .state > 5 {
		state : 5
	}
	
	else if .state < 0 {
		state : 0
	}
}
	
#timer implementation

fun timerStart() {
	tim0 : timer(10000, stateReduce)
	tim1 : timer(20000, stateReduce)
	tim2 : timer(30000, stateReduce)
	tim3 : timer(40000, stateReduce)
	tim4 : timer(50000, stateReduce)
}

fun resetTimer() {
	stoptimer(.tim0)
	stoptimer(.tim1)
	stoptimer(.tim2)
	stoptimer(.tim3)
	stoptimer(.tim4)

	timerStart()
}
