fun cube (n) {

	return .n * .n * .n

}

fun cubeSum (y) {

        var cubed, sum, currentNum
        currentNum : .y
        loop {
                until .currentNum == 0
                cubed : cube(.currentNum % 10)
                sum : .sum + .cubed
                currentNum : .currentNum / 10
        }
        return .sum

}

fun compare (testNum) {

	var cubeTest
	cubeTest : cubeSum(.testNum)
	if .cubeTest == .testNum {
		return 1 
	} 
	else {
		return 0
	}

}

fun init () {

	var numCount
	numCount : 100
	loop {
		until .numCount == 999
		
		if compare (.numCount) == 1 {
			sprint("The number '")
			iprint(.numCount)
			sprint("' meets the requirements\n")
		}
	
		numCount : .numCount + 1
	}

}
