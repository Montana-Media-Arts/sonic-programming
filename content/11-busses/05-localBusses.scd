~fbBus = Bus.audio;

// use typical busses to create an internal feedback loop
// note: requires InFeedback to read from previous cycle on bus
(
SynthDef(\feedbackDelay, {
	arg micIn = 0;
	var sig, inSig, fbSig;

	inSig = SoundIn.ar(micIn);

	fbSig = InFeedback.ar(~fbBus);

	sig = Mix([inSig, fbSig]);

	sig = DelayC.ar(sig, 2, 2);

	Out.ar(~fbBus, sig);

	Out.ar(0, sig);
}).add;
)

Synth(\feedbackDelay)



(
SynthDef(\feedbackDelay_Interal, {
	arg micIn = 0;
	var sig, inSig, fbSig;

	inSig = SoundIn.ar(micIn);

	fbSig = LocalIn.ar(1);

	sig = Mix([inSig, fbSig]);

	Out.ar(0, sig);

	sig = DelayC.ar(sig, 2, 0.1);

	LocalOut.ar(sig * 0.7);

}).add;
)

Synth(\feedbackDelay_Interal)