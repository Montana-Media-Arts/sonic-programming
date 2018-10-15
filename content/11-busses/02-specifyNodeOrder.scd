
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

	sig = In.ar(inBus);

	sig = sig * Linen.kr(Line.kr(1,0,0.1), doneAction: 2);

	sig = Limiter.ar(sig, 1.0);

	Out.ar(outBus, sig);
}).add;
)



// old way
Synth(\poppingAudio, [\inBus, ~mic], );
Synth(\in, [\outBus, ~mic]);




// specify position in node group
Synth(\in, [\outBus, ~mic]);
Synth(\poppingAudio, [\inBus, ~mic], addAction: 'addToTail' );
(
t.stop;
t = Task({inf.do({
	Synth(\poppingAudio, [\inBus, ~mic], addAction: 'addToTail' );
	1.5.rand.wait;
})}).play;
)