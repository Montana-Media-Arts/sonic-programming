// Custom Envs

(
a = {
	arg gate = 1;
	var sig, env;

	env = Env.new(
		levels: [0,    1,  0.1,    0.8,   0.1,  0.6,     0],
		times:    [0.01,  1,   0.5,    0.5,   2,    0.01],
		curve: [4, -4, 0, 4, -4, 0],
		releaseNode: 1
	);

	env = EnvGen.kr(env, gate: gate, levelScale: 0.707 );


	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

a.set(\gate, 0)





////////

(
a = {
	arg gate = 1;
	var sig, env;

	env = Env.new(
		levels: [0,    1,  0.1, 0.8,  0],
		times:    [0.01, 0.5, 0.5, 0.01],
		curve: [4, -4, 0, 4]
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale: 0.707 );


	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

a.dump

