var bulbcolor, state, bulbImg

fun init() {

	# Initialization
	html("<style> body {background-color: #cff5e7;font-family: 'Montserrat';font-weight: 400;text-align: center;margin-top: 15%;}button {width: 10%;aspect-ratio: 6;font-family: 'Montserrat';background-color: #17a2b8;margin: 5rem 2rem;border: none;color: #fff;transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;border-radius: 0.25rem;}button:hover {background-color: #138496;}button:active {background-color: #117a8b;}img {height: 200px;margin-left: auto;margin-right: auto;margin-top: -75px;}</style>")

	# Button Creation
	button("Scan&nbspOrder&nbspBarcode", proc_order)
	button("Scan&nbspPackage&nbspBarcode", proc_package)
	button("Weigh&nbspItem", proc_weight)

	# Bulb Creation
	html("<br>\n")
	bulbImg : makeimg()
        setimg(.bulbImg, "bulboff.png")

	state : 0
}

# button functions

fun proc_order() {

        if .state == 0 {
            state : 1
            do_green()
        }

        else if .state == 1 {
            state : 0
            do_green()
        }

        else if .state == 2 {
            state : 0
            do_red()
        }
}

fun proc_package() {

        if .state == 0 {
            state : 0
            do_red()
        }

        else if .state == 1 {
            state : 2
            do_green()
        }

        else if .state == 2 {
            state : 1
            do_red()
        }
}

fun proc_weight() {

        if .state == 0 {
            state : 0
            do_red()
        }

        else if .state == 1 {
            state : 1
            do_red()
        }

        else if .state == 2 {
            state : 1
            do_green()
        }
}


# bulbColor Changes

fun do_red() {
    setimg(.bulbImg, "bulbred.png")
    timer(500, reset_bulb)
}

fun do_green() {
    setimg(.bulbImg, "bulbgreen.png")
    timer(500, reset_bulb)
}

fun reset_bulb() {
    setimg(.bulbImg, "bulboff.png")
}
