(
SynthDef(\testDer, {
	arg out = 0, freq = 200, gate = 1;
	var sig, env;

	env = Env.adsr();
	env = EnvGen.kr(env, gate:  gate, doneAction: 2);
	sig = LFTri.ar(freq) * env;

	Out.ar( out, sig!2 );
}).add;
)

Synth(\testDer);

~bus = Bus.audio(s, 2);

(Pdef(\test,
	Pbind(
		\instrument, \testDer,
		\note, Pseq([0, 7, 5, 3, 0], inf),

		\out, ~bus
	)
)
)


Pdef(\test).play



(
SynthDef(\out, {
	arg in = 0, out = 0;
	var inSig, sig;

	inSig = In.ar(in, 2);

	sig = inSig * SinOsc.ar(2).linlin(-1,1,0.2,1);

	sig = CombC.ar(sig, 1, LFNoise0.kr(2).linlin(-1,1,0.01,1));

	sig = FreeVerb.ar(sig);

	Out.ar(out, sig);

}).add;
)

a = Synth(\out, [\in, ~bus]);
a.free