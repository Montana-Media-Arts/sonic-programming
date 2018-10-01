// Clock UGens

// impulse is a steady sample generator (steady meaning equal time between impulses)
// It is "non-bandlimited"
({
	var sig;

	sig = Impulse.ar(MouseX.kr(0, 100), mul: 0.7);

	Out.ar(0, sig!2);
}.play;)


// band-limited impulse generator
({
	var sig;

	sig = Blip.ar(
		MouseX.kr(0, 100).poll,
		numharm: MouseY.kr(0, 2000).poll,
		mul: 0.7
	);

	Out.ar(0, sig!2);
}.play;)




// Dust
// dust is an impulse generator that creates x-number of impulse per second.
// these are not periodic
({
	var sig;

	sig = Dust.ar(MouseX.kr(0, 1000).poll, mul: 0.7);

	Out.ar(0, sig!2);
}.play;)




({
	var sig;

	sig = Dust2.ar(MouseX.kr(0, 1000).poll, mul: 0.7);

	Out.ar(0, sig!2);
}.play;)




// LFNoise,
// creates low frequency noise values
// 0 - step
// 1 - linear ramp
// 2 - exp ramp
({
	var freq, sig;
	// freq = LFNoise0.ar(1).poll;
	// freq = LFNoise1.ar(1).poll;
	freq = LFNoise2.ar(1).poll;

	freq = freq.range(200, 400).poll;

	sig = SinOsc.ar(freq, mul: 0.7);

	Out.ar(0, sig!2);

}.play;)