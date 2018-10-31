s.boot;

(
var winenv;

// b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff");
// a custom envelope
winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);

SynthDef(\buf_grain_test, { |out, gate = 1, amp = 1, sndbuf, envbuf, dur = 0.1|
    var pan, env, freqdev, sig, rate;
    // use mouse x to control panning
    pan = 0;
    env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp,
        doneAction: Done.freeSelf);

	rate = MouseX.kr(0.1, 100).poll;

    sig = GrainBuf.ar(2, Impulse.kr(rate), dur, sndbuf, 1,
		MouseY.kr(0, 1).poll, 2, pan, envbuf) * env;

	Out.ar(0, sig);
}).add;
)

// use built-in env
x = Synth(\buf_grain_test, [\sndbuf, b, \envbuf, -1])

// switch to the custom env
x.set(\envbuf, z)
x.set(\envbuf, -1);

x.set(\dur, 0.03)

x.set(\gate, 0);