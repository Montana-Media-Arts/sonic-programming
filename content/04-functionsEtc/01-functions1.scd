


// define an addition function.
// assign that function to the envir variable 'a'
(
a = {
	arg in1=0, in2=2;
	var result;
	result = in1 + in2;
	result
}
)

// what is 'a'
a.dump

// evaluate 'a' with default values
a.value;

// evaluate 'a' replacing `in1` -> 40+2 = 42
a.value(40);

// evluate 'a' replacing `in1' and `in2` -> 40+60=100
a.value(40, 60)


// pass the return value to another variable
b = a.value(23, 42)
b




////////////////////////////////////////////////////


// this is similar

(
{
	SinOsc.ar(600);
}.play;
)