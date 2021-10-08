/*
Synth Randomness & Envelopes, Revisited
Week 6 - Oct 8th



*/

/*
The following UGens are grreat for...
- creating noise effects
- single sample moments
- or..... being used as triggers for envelopes......
*/
Impulse
// Deterministic UGen
// Creates periodic samples, at a value of 1
({
	Impulse.ar(MouseX.kr(0, 200).poll, mul: 0.5);
}.play)

Dust
// Stochastic UGen (aka. random)
// Creates aperiodic samples, at a value of 1
({
	Dust.ar(MouseX.kr(0, 200).poll, mul: 0.5);
}.play)

Blip
// Deterministic UGen
// DIFFERENT FROM IMPULSE IN THAT IT IS BAND-LIMITED
// Creates periodic samples, at a value of 1
({
	Blip.ar(MouseX.kr(0, 200).poll, mul: 0.5);
}.play)




// Simple Envelopes
Line
// creates a line envelope
({
	var sig, env;
	env = Line.kr(1, 0, 2);
	sig = WhiteNoise.ar(0.7) * env;
}.play;)

({
	var sig, env;
	env = Line.kr(0, 1, 2);
	sig = SinOsc.ar(freq: env.range(100, 200), mul: 0.7) * env;
}.play;)


XLine
// parabolic line
{XLine.kr(2, 1, 2).range(0, 1)}.plot(duration: 2)
({
	var sig, env;
	env = XLine.kr(100, 200, 2);
	sig = SinOsc.ar(freq: env, mul: 0.7);
}.play;)



Linen
// Linen is a simple ASR (attack, sustain, release) envelope
// requires a value above 0, to trigger
{Linen.kr(Impulse.kr(0.5))}.plot(duration: 1)
({
	var sig, env;
	env = Linen.kr(
		gate: Impulse.kr(0.5),
		attackTime: 0.01,
		susLevel: 1.0,
		releaseTime: 1,
		doneAction: 0
	);

	sig = SinOsc.ar(200, mul: 0.7) * env;
}.play;)

({
	var sig, env;
	env = Linen.kr(
		// randome frequency triggering
		gate: Dust.kr(3),
		attackTime: 0.01,
		susLevel: 1.0,
		releaseTime: 1,
		doneAction: 0
	);

	sig = SinOsc.ar(env.range(200, 400), mul: 0.7);
}.play;)

({
	var sig, env;
	env = Linen.kr(
		// Use Mouse to trigger
		// if mouse is > 0.0, gate is open, and sustain gets held
		// as soon as gate value drops < 0.0, release is activated
		gate: MouseX.kr(-0.1, 1).poll,
		attackTime: 0.5,
		susLevel: 1.0,
		releaseTime: 0.01,
		doneAction: 0
	);

	sig = SinOsc.ar(env.range(200, 400), mul: 0.7);
}.play;)


({
	var sig, env;
	env = Linen.kr(
		// Use Mouse to trigger
		// if mouse is > 0.0, gate is open, and sustain gets held
		// as soon as gate value drops < 0.0, release is activated
		gate: Dust.kr(3),
		attackTime: 0.01,
		susLevel: 1.0,
		releaseTime: 0.1,
		doneAction: 0
	);

	sig = SinOsc.ar(200, mul: 0.7) * env;
}.play;)

({
	var sig, env;
	env = Linen.kr(
		// Use Mouse to trigger
		// if mouse is > 0.0, gate is open, and sustain gets held
		// as soon as gate value drops < 0.0, release is activated
		gate: SinOsc.kr(1).poll,
		attackTime: 0.01,
		susLevel: 1.0,
		releaseTime: 0.5,
		doneAction: 0
	);

	sig = SinOsc.ar(200, mul: 0.7) * env;
}.play;)



Env
EnvGen
({
	var sig, env;
	// create and specify an envelope shape
	env = Env.adsr(
		attackTime: 0.01,
		decayTime: 0.3,
		sustainLevel: 0.1,
		releaseTime: 0.1,
		peakLevel: 1.0,
		curve: -4
	);
	// create a signal from the envelope shape
	env = EnvGen.kr(
		envelope: env,
		gate: MouseX.kr(-1,1),
		levelBias: 0,
		timeScale: 1,
		doneAction: 0
	);

	sig = SinOsc.ar(200, mul: 0.7) * env;
}.play;)


Done

Gate
Stepper
Select
Trig1
Latch


