/*
Week 7
Signal processing in SC

Signal Processing UGens
*/


o = s.options;
o.inDevice = "BIG KNOB STUDIO";
s.reboot;

// delay the input signal by 1 sec
(
SynthDef(\spExs, {
	arg in=0, out = 0;
	var inSig, sig;

	inSig = SoundIn.ar(in);

	sig = DelayN.ar(inSig, 1, 1);

	Out.ar(0, sig);

}).play;
)

// create an example that we can alter the delay time in realtime
(
SynthDef(\spExs, {
	arg in=0, out = 0, delayT = 1;
	var inSig, sig;

	inSig = SoundIn.ar(in);

	sig = DelayN.ar(inSig,
		maxdelaytime: 4,
		delaytime: delayT
	);

	Out.ar(0, sig);

}).add;

a = Synth(\spExs);
)

a.set(\delayT, 3)
a.set(\delayT, 0.3)


//////////////////////////////////////////////////

(
SynthDef(\spExs, {
	arg in=0, out = 0, delayT = 1, wetDryRatio=0.5;
	var inSig, sig;

	inSig = SoundIn.ar(in);

	sig = DelayN.ar(inSig,
		maxdelaytime: 4,
		delaytime: delayT
	);

	// wetDry mix stuff
	inSig = inSig  * (1-wetDryRatio);
	sig = sig * wetDryRatio;

	sig = Mix([inSig, sig]);

	Out.ar(0, sig);

}).add;

a = Synth(\spExs);
)

a.set(\wetDryRatio, 0)
a.set(\delayT, 3)
a.set(\delayT, 0.3)


