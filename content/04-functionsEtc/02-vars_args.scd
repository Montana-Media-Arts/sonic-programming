/*

What is the difference between arg's and var's in SC?

*/

// pyramid based signal flow
(
{
	var sig;

	// initialize sig with the output is SinOsc
	sig = SinOsc.ar(
		300,
		mul: SinOsc.ar(
			1,
			phase: 0,
			mul: SinOsc.ar(
				0.67,
				phase: 0,
				mul: 0.5,
				add: 0.5),
			add: 0.5
		)
	);

	// output sig
	sig
}.play;
)


// variable based signal flow
(
{
	var sig, mod;

	// initialize sig with the output is SinOsc
	sig = SinOsc.ar(300);
	// multiply sig by an amp mod sinosc
	mod = SinOsc.ar(1, phase: 0, mul: 0.5, add: 0.5);
	mod = mod * SinOsc.ar(0.67, phase: 0, mul: 0.5, add: 0.5);

	sig = sig * mod;

	// output sig
	sig
}.play;
)


///////////////////////////////////////////////

// use arguments for values, objects, or data that may change between instanciations or through external means
(
a = {
	arg carrFreq = 300;
	var sig, mod;

	// initialize sig with the output is SinOsc
	sig = SinOsc.ar(carrFreq);
	// multiply sig by an amp mod sinosc
	mod = SinOsc.ar(1, phase: 0, mul: 0.5, add: 0.5);
	mod = mod * SinOsc.ar(0.67, phase: 0, mul: 0.5, add: 0.5);

	sig = sig * mod;

	// output sig
	sig
}.play;
)

a.set(\carrFreq, 600)




// To set an arguments value in an existing Synth,
// reference the synth,
// utilize the `.set()` method
// specify the argument to change and a value
a.set(\carrFreq, 600);
a.set(\carrFreq, 1200);
a.set(\carrFreq, 2400);
