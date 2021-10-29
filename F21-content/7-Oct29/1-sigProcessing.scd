/*
Week 7
Signal processing in SC

Buses
*/


(
SynthDef(\pings, {
	arg note=60, amp=(-6), out = 0;
	var env, sig;

	env = Dust.ar(2).lag(0, 0.3);

	sig = SinOsc.ar(freq: note.midicps, mul: amp.dbamp);
	sig = sig * env;

	Out.ar(out, sig!2);
}).add;
)

Synth(\pings);

(
SynthDef(\white_pings, {
	arg note=60, amp=(-6), out = 0;
	var env, sig;

	env = Dust.ar(2).lag(0, 0.3);

	sig = WhiteNoise.ar(mul: amp.dbamp);
	sig = sig * env;

	Out.ar(out, sig!2);
}).add;
)

Synth(\white_pings);



//////////////////////////////////////




(
SynthDef(\audioBusIn, {
	arg in = 0;
	var sig;

	sig = In.ar(in);

	Amplitude.kr(sig).poll(label:\amp);

	Out.ar(0, sig);
}).add;
)

Synth(\audioBusIn, [in: ~audioBus.index]);

// Start the audio bus in synth
// receive audio in bus 6
// this is then routed to the main bus (i.e. 0)
Synth(\audioBusIn, [in: 6])

// start the white ping synth
// send the audio to bus 6
Synth(\white_pings, [out: 6]);


// Use an NAMED Audio Bus
// instanstiate the audio bus
~audioBus = Bus.audio(s, 1);
// notice it created a new audio bus
// to explcitily reference the bus channel number, use the .index method
~audioBus.index


Synth(\audioBusIn, [in: ~audioBus.index])
Synth(\white_pings, [out: ~audioBus.index]);
Synth(\pings, [out: ~audioBus.index]);



/////////////////////////////////////////
// Order of Operations of Matters
// THE FOLLOWING DOES NOT WORK
// you MUST create the conduit, before you send something to it!
Synth(\white_pings, [out: ~audioBus.index]);
Synth(\audioBusIn, [in: ~audioBus.index]);



// OR YOU MUST TELL SC WHAT TO DO EXPLCIITLY
Synth(\white_pings, [out: ~audioBus.index]);
// use "addAction" to explicitly add to the end of the signal chain
Synth(\audioBusIn, [in: ~audioBus.index], addAction: 'addToTail');

// SAME THINGS BUT IN STEREO
(
SynthDef(\audioStBusIn, {
	arg in = 0;
	var sig;

	sig = In.ar(in, 2);

	Amplitude.kr(sig).poll(label:\amp);

	Out.ar(0, sig);
}).add;
)
~audioStBus = Bus.audio(s, 2);
Synth(\white_pings, [out: ~audioStBus.index]);
Synth(\audioStBusIn, [in: ~audioStBus.index], addAction: 'addToTail');



