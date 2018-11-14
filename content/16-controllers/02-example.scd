
(SynthDef(\der, {
	arg freq = 440, modRate = 0;
	var sig;

	sig = SinOsc.ar(freq, mul: 1 - SinOsc.ar(modRate).linlin(-1,1,0,1) );


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

	if(~bank[note] != nil, {
		~bank[note].free;
		~bank[note] = nil;
	});

},
(0..127)// set to accept all note numbers
);

)



MIDIdef.freeAll