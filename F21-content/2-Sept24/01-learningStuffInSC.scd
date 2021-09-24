
// Reviewing basic Synth creation
{SinOsc.ar(freq: 200, mul: 0.3)}.play;
{SinOsc.ar(freq: 232, mul: 0.3)}.play;
{SinOsc.ar(freq: 376, mul: 0.3)}.play;
{SinOsc.ar(freq: 976, mul: 0.3)}.play;
{SinOsc.ar(freq: 2000, mul: 0.3)}.play;

// use Cmd/Cntrl+. to kill all playing synths


///////////////////////////////////////////////
// Variables

/*
Variable, references some piece of data, for later use or retrieval
*/

(
// declare a namespace of 'val'
var val;

// assign a value to our namespace
val = 3;
// overwrite our namespace with a new value
val = 7;

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)



(
var val;
val = 1;
val = val * 2;
val = val**4;

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)


(
var val;
val = "Hello everyone.";

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)


/////////////////////////////////////////////
// variables in synths
(
{
	// declare two variabes
	var sig, freq = 200;

	// assign the mouse value, to variable freq
	freq = MouseX.kr().range(200, 400);
	// create a signal, and assign it to variable 'sig'
	sig = SinOsc.ar(freq: freq, mul: 0.3);

	// output sig to speakers
	sig;
}.play;
)

/////////////////////////////////////////////
// Environmet Variable
/*
we can think of these as "global variables"

by default, the characters a-z, are assiged as envirnment variables

*/
(
a = {SinOsc.ar()}.play;
)

// I can now free the synth, more eloquently
a.free;


// this is useful when working with lots of synths
a = {SinOsc.ar(freq: 200, mul: 0.3)}.play;
b = {SinOsc.ar(freq: 232, mul: 0.3)}.play;
c = {SinOsc.ar(freq: 376, mul: 0.3)}.play;
d = {SinOsc.ar(freq: 976, mul: 0.3)}.play;
e = {SinOsc.ar(freq: 2000, mul: 0.3)}.play;

c.free
b.free
a.free
e.free
d.free

