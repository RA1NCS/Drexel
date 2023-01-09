# SHREYAN GUPTA
# sg3778
# LAB 066


# OPTIMIZATION / IMPROVEMENT:
#	Since in the following program, the maximum power used is 2, instead of creating the entire function 'pow()' for it, which has the time complexity 0^n, we can simply replace 'pow(.t, 2)' by 
#	'.t * .t', which would reduce both the time complexity and memory usage. Also, instead of declaring a constant g, and assigning it to -10, we can simply replace '.g/2' by '-5', which will reduce 
#	the number of mathematical operations required to do by the computer, and reduce the amount of storing, fetching, and executing instructions required to be done by the computer, optimizing the program.

# 	So in the end, we can replace the statement 'calc()' in the cycle() function by the following: '-5 * (.t * .t*) + (.v * .t)'. We can then remove the functions 'calc()' and 'pow()' entirely.
# 	This should reduce the time complexity of the function 'cycle()' from O(n^2) to O(n).


# OTHER COMMENTS:
#	I noticed that the program esssentially utilizes the formula : s = u * t + 1/2 (a * t^2). This is done in the function calc(), and so, the program presumably outputs the distance of the ball from the
#	origin, while it was up in the air per second, till it returns back to the origin.


# START OF CODE #

var t, h, g, v
# 'var t' initializes t, which is the a variable that is constantly incremented, used in the function 'calc()', and presumably represents the time elapsed since the ball was thrown.
# 'var h' initializes h, which is the variable that is used as the stop condition for the function 'cycle()', and presumably represents the current distance of the ball in air from the origin.
# 'var g' initializes g, which is a constant value of -10, which never changes, but it used for calculation in the function 'calc()', representing the gravitational constant (g) which is 9.81 m/s^2.
# 'var v' initializes v, which is essentially the value input by the user, which presumably represents the initial velocity of the ball.

# this function recursively calls itself, till the value of h is less than 0, and keeps calling the function 'calc()' and itself till the beforementioned condition is met.
fun cycle() { 
	if (.h >= 0 ) {								# stop condition for this recursive function (base case)
		sprint ("   ")
                iprint (.t)						# prints contents of t
                sprint (" | ")					# formatting of output table
                iprint(.h)						# prints contents of h
                sprint ("\n")					# formatting of output table : adds a new line

		t : .t + 1								# counter incrementing t		
		calc()									# calls the function calc
		cycle()									# recusive step
	}

	return 0									# will return 0 if h is less than 0
}


# this function updates the value of h
fun calc() {
	h : ((.g/2) * pow(.t, 2)) + (.v * .t)		# multiplies -5 with the square of t, and then adds the product of v and t, and stores it in h GLOBALLY
}


# this function takes in two parameters, a and b, and returns the value of 'a' raised to the power 'b'
fun pow(a, b) {
	var r										# r is initialized as a variable
	r : 1										# variable r's value is assigned to 1

	loop {						
		until .b <= 0							# makes the function run 'b' times
		r : .r * .a								# multiplication of the number by itself
		b : .b - 1								# decrementation of b
		}

	return .r									# returns 'a' raised to power 'b'
}


# main initializer function
fun init() {
	var ui										# ui is initialized as a variable

	ui : iread("Enter an initial velocity")		# reads the user's input and stores it in ui

	t : 0										# assigns the value '0' to the variable t
	h : 0                                       # assigns the value '0' to the variable h
	v : .ui                                     # assigns the previously taken userInput to the variable v
	g : -10										# assigns the value '-10' to the variable g
		
        sprint ("Time | Height\n")				# formatting of output table : headings
	sprint ("-----|-------\n")					# formatting of output table : divider
	cycle()										# calls the recursive function 'cycle()'
}
