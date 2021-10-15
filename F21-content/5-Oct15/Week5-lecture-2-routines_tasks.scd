/*
Week 7

Language Side Scheduling with Tasks and Routines


*/

// Tell SC To do "something" in 5 seconds
SystemClock.sched(5, { "hello".postln });

// do something, some specified number of times
a = 0;
30.do( { a=a+1; a.postln; } )


///////////////////////////////////////
// create a routine to execute over time
(
// assign a function to the variable a
~someRoutine = {
	// do something for infinite
	inf.do(
		{ // <- the function to execute
			// play this synth every iteration
			Synth(\Boink, [freq: 500]);
			// PAUSE THE ROUTINE THIS AMOUNT OF TIME
			0.1.wait;
	})
	// create a routine from the specified function
}.fork;
)

~someRoutine.stop; // stop the routine

// call help on Routine
Routine



////////////////////////////////////////////////////////////

Task

// Tasks are like Routines, but better


(
~task = Task({
	{
		"Yo!".postln;
		0.5.wait;
	}.loop;
});
)
~task.play



// define a simple synth
(
SynthDef(\simpleTri, {
	arg freq=200, amp=0.7;
	var sig;

	sig = LFTri.ar(freq, mul: amp);
	sig = Pan2.ar(sig, 0);
	Out.ar(0, sig);
}).add;
)
// play the synth, and store reference in ~tri
~tri = Synth(\simpleTri)

(
// define a task
~task = Task({
	// the tasks function, is to set the synth frequency
	{
		var freq, delta;
		freq = rrand(200, 2000).postln;
		~tri.set(\freq, freq);

		delta = [0.125, 0.25, 0.5].choose;
		delta.wait;
	}.loop;
});
)

(

~tri = Synth(\simpleTri);
~task.play;
)


////////
(
// define a task
~task = Task({
	// the tasks function, is to set the synth frequency
	{
		var freq, delta;
		// define a frequency value to use
		freq = rrand(200, 2000).postln;
		// define a randome wait time
		// this determines interonset time between notes
		// the length of each note is also a function of this
		delta = [0.125, 0.25, 0.5].choose;

		// instantiate a new synth, with the specified freq, and length
		Synth(\Boink, [freq: freq, length: delta*10]);

		// wait determined time before next synth
		delta.wait;
	}.loop;
}).play;
)

(
~idx = 0;
~freqArr = [60, 62, 64, 65, 67, 69, 71, 72];
// define a task
~task = Task({
	// the tasks function, is to set the synth frequency
	{
		var freq, delta;
		// define a frequency value to use

		freq = ~freqArr[~idx];
		~idx = ~idx+1;
		~idx = ~idx.mod(~freqArr.size);
		// define a randome wait time
		// this determines interonset time between notes
		// the length of each note is also a function of this
		delta = [0.25, 0.5].choose;

		// instantiate a new synth, with the specified freq, and length
		Synth(\Boink, [freq: freq.midicps, length: delta*10]);

		// wait determined time before next synth
		delta.wait;
	}.loop;
}).play;
)

TempoClock.default.tempo = 60/60




/// from the help docs
(
SynthDef(\singrain, { |freq = 440, amp = 0.2, sustain = 1, out|
	var sig;
	sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.perc(0.01, sustain), doneAction: Done.freeSelf);
	Out.ar(out, sig ! 2);    // sig ! 2 is the same as [sig, sig]
}).add;
)


(
t = Task({
	loop {
		[60, 62, 64, 65, 67, 69, 71, 72].do(
			{
				arg midi, idx;
				var mul;

				mul.postln;

				mul = rrand(0, 1);

				idx.postln;
				midi.postln;
				"".postln;

				Synth(\singrain, [freq: midi.midicps, amp: mul, sustain: 0.1]);
				0.125.wait;
		});
	}
}).play;
)

// probably stops in the middle of the scale
t.stop;

t.play;    // should pick up with the next note

t.stop;