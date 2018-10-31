
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

Synth(\in, [\outBus, ~mic]);


// create a effects synth
(
SynthDef(\poppingAudio, {
	arg inBus = 0, outBus = 0, popRate = 10;
	var sig;

	sig = In.ar(inBus);

	sig = sig * Linen.kr(Dust.ar(popRate).round);

	sig = Limiter.ar(sig, 1.0);

	Out.ar(outBus, sig);
}).add;
)

Synth(\poppingAudio, [\inBus, ~mic]);