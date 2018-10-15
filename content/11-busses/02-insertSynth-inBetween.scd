
// create an audio bus for mic synth
// ~mic = Bus.audio();
~fx = Bus.audio;


// basic input synth
(
SynthDef(\in, {
	arg micIn = 0, outBus = 0;
	var sig;

	sig = SoundIn.ar(micIn);
	sig = Normalizer.ar(sig, -3.dbamp);
	sig = DelayC.ar(sig, 1, 1);

	Out.ar(outBus, sig);

}).add;
)

// create a effects synth
(
SynthDef(\masterOut, {
	arg inBus = 0, outBus = 0, popRate = 10;
	var sig;

	sig = In.ar(inBus);

	sig = Limiter.ar(sig, 1.0);

	Out.ar(outBus, sig);
}).add;
)

~micSynth = Synth(\in, [\outBus, ~fx]);

~masterOut = Synth(\masterOut, [\inBus, ~fx], addAction: 'addToTail');



(
SynthDef(\selfRegulator, {
	arg inBus = 0, outBus = 0;
	var sig, ampVal;

	sig = In.ar(inBus);

	ampVal = (Amplitude.kr(sig, 0.01, 1)*1).clip(0, 1);

	sig = sig * (1-ampVal).poll;


	// adds signal to existing contents of bus
	// Out.ar(outBus, sig);

	// replace the contents of a bus (useful to revent mixing of contents on bus)
	ReplaceOut.ar(outBus, sig);
}).add;
)

(
~regulator = Synth(\selfRegulator,
	[\inBus, ~fx, \outBus, ~fx],
	target: ~masterOut,
	addAction: 'addBefore');
)

~regulator.free