
(SynthDef(\der, {
	arg freq = 440, modRate = 0;
	var sig;

	sig = SinOsc.ar(freq, mul: 0.5 - SinOsc.ar(modRate).linlin(-1,1,0,0.5) );


	Out.ar(0, sig!2);
}).add
)

// test the synth
a = Synth(\der)
a.set(\modRate, 2)



(
~bank = Array.newClear(127);

MIDIdef.noteOn(\noteOn, {
	arg ...args;
	var note, val;
	args.postln;

	note = args[1];
	~bank[note] = Synth(\der, [\freq, note.midicps]);

},
(0..127)// set to accept all note numbers
);


MIDIdef.noteOff(\noteOff, {
	arg ...args;
	var note, val;
	args.postln;

	note = args[1];
	~bank[note].free;

},
(0..127)// set to accept all note numbers
);


MIDIdef.cc(\changeModRate, {
	// arg val, num, chan, src;

	// val.postln;
	// num.postln;
	// chan.postln;
	// src.postln;
	// "".postln;

	arg ...args;


	var val = args[0];

	~bank.do({
		arg synth, i;
		if(synth.notNil, {
			synth.set(\modRate, val);
		})
	})

},
(0..127)
)


)