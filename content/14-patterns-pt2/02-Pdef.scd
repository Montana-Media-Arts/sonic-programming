(
SynthDef(\yeah, {
	arg freq = 440, amp = 0.707, gate = 1, sustain = 1, modFreq = 20;
	var sig, env;

	env = Env.adsr(0.01*sustain, 0.3*sustain, amp * 0.5, 0.5*sustain);
	env = EnvGen.kr(env, gate, amp, doneAction: 2);

	sig = SinOsc.ar(freq, mul: env);
	sig = sig * SinOsc.ar(modFreq).linlin(-1,1,0,1);

	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);
}).add;
);


(
Pdef(\yeahPat,
	Pbind(
		\instrument, \yeah,
		// replace note with a Pdef
		\note, Pdef(\notePat, Pseq([0, 0, 7, 7, 9, 9, 7], inf)),
		\dur, Pseq([1,1,1,1,1,1,2], inf),
		// \amp, Pseq([1, 1, 0.5, 0.5, 0.25, 0.25, 1], 1)
		\db, -6,
		\sustain, 0.7,
		\modFreq, Prand([2, 20, 60, 120], inf),
		\test, Pfunc({|ev| ~der = ev})
	)
)
);

Pdef(\yeahPat).play;

// you can then change the pattern in realtime!!!!!
Pdef(\notePat, Pseq([9, 11, 0], inf));