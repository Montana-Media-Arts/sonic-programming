(
{
	SinOsc.ar(400) * SinOsc.ar(100, mul: 0.5, add: 0.5)
}.play;
)

// Using variables to control signal flow
(
{
	var carr, mod, outputSig;

	carr = SinOsc.ar(400);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr * mod;
}.play;
)

// Using arguments for single pieces of data
(
{
	arg carrFreq = 400;
	var carr, mod, outputSig;

	carr = SinOsc.ar(carrFreq);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr * mod;
}.play;
)


// in SC a-z are set aside as global "environment variables"
c = 300;
c // <- execute this line to get back the value in c

// define your own global envrionemnt variable with '~'
~myVar = "Michael Musick is tired";
~myVar






// Use a env variable to store a synth instance
(
a = {
	arg carrFreq = 400;
	var carr, mod, outputSig;

	carr = SinOsc.ar(carrFreq);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr * mod;
}.play;
)

// change arguments of an active synth instance
a.set(\carrFreq, 100)
// show that 'a' is an instance of a synth
a.dump