// Hello World of SuperCollider


// Racer's start your engines
// BOOTING THE SERVER
// To get started, boot the server
// either execute
s.boot;
// or under "Server" select "Boot Server"


///////////////////////////////////
// HELLO WORLD of SUPERCOLLIDER
// Create an object, of class type Sine Oscillator
// Tell that object to perform at audio rate (.ar)
(
{SinOsc.ar}.play;
)
// the '{}' create a function.
// the '.play' method, tells the interepreter to create an audio synth, and play that function


//////////////////////////////////
// To STOP
// Press Cmd/Cntrl+.
// or Select "Stop" under the Language Tab


///////////////////////////////////
// Bring up a meter to visually tells us what is going on
// press Cmd/Cntrl+M
// or execute
s.meter;



////////////////////////////////////
// Arguments!!!!
// Arguments, change the values for an object's method
(
{
	SinOsc.ar(freq: 200, mul: 0.1);
}.play;
)

// To see what arguments exist, are default to, or generally do, pull up help on a class.
// To pull up help, select the class, and press Cmd/Cntrl+d


////////////////////
// MULTIPLE SYNTHS
// We can execute consectutive synths, to create complex waves
{SinOsc.ar(freq: 200, mul: 0.1);}.play;
{SinOsc.ar(freq: 400, mul: 0.1);}.play;
{SinOsc.ar(freq: 800, mul: 0.1);}.play;
{SinOsc.ar(freq: 967, mul: 0.1);}.play;

//////////////////////
// Let's do something "interactive"
// SC Theremin
(
{
	SinOsc.ar(
		freq: MouseX.kr( minval: 100, maxval: 12000),
		mul: MouseY.kr(minval: 0, maxval: 1)
	);
}.play;
)