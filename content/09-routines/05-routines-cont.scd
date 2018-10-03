(
SynthDef(\simpleSine, {
	arg freq = 440;
	var sig;

	sig = SinOsc.ar(freq, mul: -3.dbamp);

	Out.ar(0, sig!2);
}).add;
)

a = Synth(\simpleSine)


(
r = Routine({

	a = Synth(\simpleSine);
	0.1.wait;

	13.do({ arg id;
		a.set(\freq, (id + 60).midicps );
		1.wait;
	});
	a.free;
})
)

r.play;




(
t = Task({
	a = Synth(\simpleSine);
	0.1.wait;

	13.do({ arg i;
		a.set(\freq, (i + 60).midicps );
		1.wait;
	});
	// a.free;
});
)


//////////////////////////////////////////////


(
SynthDef(\ping, {
	arg freq = 440, len = 1, amp = 1;

	var sig, env, pos;

	env = Env.new([0,1, 0.1, 0.1, 0], [0.1, 0.05, 0.75, 0.1]);
	env = EnvGen.kr( env, timeScale: len, doneAction: 2 );

	sig = SinOsc.ar( [freq, freq*1.01], mul: amp ) * env;
	sig = Mix(sig);

	pos = LFNoise2.ar(Rand.new(0.1, 10));

	sig = Pan2.ar( sig, pos );


	Out.ar(0, sig );
}).add
)

Synth(\ping)


(
t = Task({

	inf.do({
		var freq, len, amp;
		freq = rrand(200.0, 800.0).postln;
		len = rrand(1.0, 10.0).postln;
		amp = rrand(-24.0, -3.0).postln;
		"".postln;

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);

		rrand(0.01, len).wait;
		// len.wait;
	})
})
)

t.start

t.pause


///////////////////////////////////////////////



c = TempoClock.new( 4, 0 )

(
t = Task({

	inf.do({
		var freq, len, amp;
		freq = rrand(200.0, 800.0);
		len = rrand(0.2, 4.0);
		amp = rrand(-24.0, -3.0);

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);

		// rrand(0.01, len).wait;
		1.0.wait;
	})
},
clock: c
)
)

t.start

// leave t running for the following

c = TempoClock.default;

// reference to default tempoclock
c

c.tempo

c.tempo = 120/60;

c.tempo = 240/60;

c.tempo = 30/60;









d = TempoClock.new( 0.5, 0 )

(
f = Task({

	inf.do({
		var freq, len, amp;
		freq = rrand(50.0, 200.0);
		len = rrand(0.2, 4.0);
		amp = rrand(-24.0, -3.0);

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);

		// rrand(0.01, len).wait;
		1.0.wait;
	})
},
clock: d
).play
)

d.tempo = 2/5









