/////////////////////////////
/*
October 1st

Envelope

Envelope - wraps, some parameter to values over time

*/


// line envelope
// create a linear line from 1 value, to a 2nd value, over time.
({
	var sig, env;

	env = Line.kr(2000, 1000, 6);

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: env, mul: 0.3);
}.play;
)


// plot the difference between line and xline
(
{
	[
		Line.kr(1, 1000, 0.1),
		XLine.kr(1, 1000, 0.1)
	]
}.plot(duration: 0.1)
)


// XLine -> is a parabolic line
({
	var sig, env;

	env = XLine.kr(2000, 1000, 4);

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: env, mul: 0.3);
}.play;
)

// EnvGen
// generates various types of envelopes

Env.triangle(dur: 1, level: 1).test.plot
({
	var sig, envShape, envSig;

	// create an envelope shape
	envShape = Env.triangle(dur: 1, level: 1);
	envSig = EnvGen.kr(envShape).range(40, 100);

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: envSig, mul: 0.3);
}.play;
)

({
	var sig, envShape, envSig;

	// create an envelope shape
	envShape = Env.adsr(
		attackTime: 0.1,
		decayTime: 0.3,
		sustainLevel: 0.5,
		releaseTime: 1
	);
	envSig = EnvGen.kr(envShape).range(40, 100);

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: envSig, mul: 0.3);
}.play;
)