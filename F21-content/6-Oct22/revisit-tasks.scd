{SinOsc.ar(MouseX.kr(800, 3000, 1).poll + SinOsc.ar(350, mul: 400)) * 0.2!2}.play;

(
SynthDef (\fm, {
	arg freq = 500, mRatio = 1, cRatio = 1, modAmp = 200,
	amp = 0.2, atk = 0.01, rel = 3, pan = 0;
	var car, mod, sig, env, sinAmpEnv, envShape;
	envShape = Env.perc(atk, rel);
	env = EnvGen.kr(envShape, doneAction: 2);
	// env = EnvGen.kr(envShape, gate: Dust.kr(2), doneAction: 0);

	// env = Line.kr(1, 0, 5);
	mod = SinOsc.ar(freq * mRatio, mul: modAmp);
	sig = SinOsc.ar(freq * cRatio + mod);
	sig = env * amp * sig;
	sig = Pan2.ar(sig, pan);
	Out.ar(0, sig);
}).add;
)

Synth(\fm, [\freq, 62.midicps, \cRatio, 0]);

Synth(\fm, []);



(
~task1 = Task(
	{
		inf.do({

			"Start of 1".postln;
			Synth(\fm, [\freq, 60.midicps, \cRatio, 1]);
			2.wait;


			Synth(\fm, [\freq, 62.midicps, \cRatio, 1]);
			1.wait;

			Synth(\fm, [\freq, 64.midicps, \cRatio, 1]);
			1.wait;

			Synth(\fm, [\freq, 65.midicps, \cRatio, 1]);
			2.0.wait;

			Synth(\fm, [\freq, 60.midicps, \cRatio, 1]);
			Synth(\fm, [\freq, 64.midicps, \cRatio, 1]);
			Synth(\fm, [\freq, 67.midicps, \cRatio, 1]);
			2.0.wait;
		})

	}
);

~task2 = Task(
	{
		inf.do({

			"Start of 2".postln;
			Synth(\fm, [\freq, 60.midicps, \cRatio, 4]);
			1.wait;


			Synth(\fm, [\freq, 62.midicps, \cRatio, 4]);
			2.wait;

			Synth(\fm, [\freq, 64.midicps, \cRatio, 4]);
			1.wait;

			Synth(\fm, [\freq, 65.midicps, \cRatio, 4]);
			1.0.wait;

			Synth(\fm, [\freq, 60.midicps, \cRatio, 4]);
			Synth(\fm, [\freq, 64.midicps, \cRatio, 4]);
			Synth(\fm, [\freq, 67.midicps, \cRatio, 4]);
			3.0.wait;
		})

	}
)
)

~task1.reset;
~task2.reset;
~task1.play(quant:4);
~task2.play(quant:4);

~task1.stop;
~task2.stop;


TempoClock.default.tempo = 120/60
TempoClock.default.tempo = 60/60

(
~mainTask = Task({

	"step 1".postln;
	~task1.play(doReset:true);
	2.wait;

	"step 2".postln;
	~task2.play(doReset:true);
	2.wait;

	"step 3".postln;
	~task1.reset;
	~task2.reset;
	4.wait;

	"step 4".postln;
	~task1.stop;
	4.wait;

	"step 5".postln;
	~task1.play(doReset:true);
	8.wait;

	"STOP".postln;
	~task1.stop;
	~task2.stop;
}).play;
)