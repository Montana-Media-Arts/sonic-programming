// we can use InFeedback to grabn information from a bus,
// even if that information occurs later in the node tree.



// create an audio bus for mic synth
~mic = Bus.audio();


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
SynthDef(\poppingAudio, {
	arg inBus = 0, outBus = 0, popRate = 10;
	var sig;

	sig = InFeedback.ar(inBus);

	sig = sig * Linen.kr(Line.kr(1,0,0.1), doneAction: 2);

	sig = Limiter.ar(sig, 1.0);

	Out.ar(outBus, sig);
}).add;
)


// Notice that popping is now first, but InFeedback still grabs the signal.
Synth(\in, [\outBus, ~mic]);
Synth(\poppingAudio, [\inBus, ~mic], );

(
t = Task({
	inf.do({
		Synth(\poppingAudio, [\inBus, ~mic], );
		1.5.rand.wait;
})}).play;
)
