// Linear Envelopes (or envelopes over time)

({
	var sig, env;

	env = Linen.kr(
		// gate: Line.kr(1,0,0.01),
		gate: MouseButton.kr(0,1,0),
		attackTime: 0.1,
		susLevel: 0.707,
		releaseTime: 0.5
	);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)



// lets look at more codified envelopes

// for all other envelopes, we need a seperate UGen and envelope specification
// UGEN -> EnvGen.ar/kr
// Specification comes from the `Env` class.

Env


({
	var sig, env;

	env = Env.perc(
		attackTime: 0.1,
		releaseTime: 0.5,
		level: 1.0,
		curve: -3
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707 );


	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

// Env.linen is == in many ways to Env.asr
({
	var sig, env;

	env = Env.linen(
		attackTime: 0.1,
		sustainTime: 0.5,
		releaseTime: 0.5,
		curve: 0
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707 );


	sig = SinOsc.ar(800) * env;

	Out.ar(0, sig!2);
}.play;)



({
	var sig, env;

	env = Env.asr(
		attackTime: 0.1,
		sustainLevel: 1,
		releaseTime: 0.5,
		curve: 0
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707 );


	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)





// ADSR
({
	var sig, env;

	env = Env.adsr(
		attackTime: 0.01,
		decayTime: 0.5,
		sustainLevel: 0.01,
		releaseTime: 0.5,
		peakLevel: 1
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707 );


	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)
