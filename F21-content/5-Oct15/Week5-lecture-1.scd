/*
Week 7

Notes and some sort of lecture

Synths and SynthDefs


*/

// As an FYI, the character 's', is reserved to reference the SC Server
s
// this means we have easy access to the server
// if a call the ".makeWindow" method, it brings up an old school, but useful server representation window
s.makeWindow

// likewise, we can use localhost reference to pull up other useful tools
s.meter // <- this is the same as pressing cmd/cntrl+m

//scope
s.scope

// examine "GUI Methods" under the server help file, for more of what you can call up
Server





//////////////////////////////////////////////

// Synths are active sound processes, running on the server
// if we create a basic sinosc function, and tell it to play, we explicitely create a synth
({SinOsc.ar()}.play)

// There are more ways to do this.....
// open help on SynthDef, and read through it
SynthDef


/*
A ""SynthDef"" is the proper way to define a synth for future use on the server.

Therre are advantages to using the SynthDef terminology, which will become clear as we progress.

It is essentially, no different than using the function-play approach ({}.play).
*/

SynthDef(
	\synthName,
	{}/*ugen graph - i.e. the function*/
).add

(
SynthDef(\myFirstSynthDef, {
	// arguments are what we can change when we instantiate a new synth instance
	arg freq = 200;

	// variables, just like in other functions, variables help organize code
	var sig;

	sig = SinOsc.ar(freq: freq) * -3.dbamp;

	// MUST INCLUDE THE OUT UGen in SynthDefs
	Out.ar(0, sig);
}).add;
)


// To Play this new SynthDef, we must call it
a = Synth(\myFirstSynthDef);
a.free
Synth // <- read through help file for Synth Class

// we can now create unique variations for each synth instance
Synth(\myFirstSynthDef, [\freq, 100]);
Synth(\myFirstSynthDef, [\freq, 200]);
Synth(\myFirstSynthDef, [\freq, 400]);

a = Synth(\myFirstSynthDef);
a.set(\freq, 100);



/////////////////
// Another Example
(
SynthDef(\Boink, {
	arg freq = 400, length = 1;
	var envDef, env, sig;

	// envelope definition
	envDef = Env.new(
		[0, 1, 0],
		[0.05, 0.5],
		[10, -10]
	);

	// as a control signal
	env = EnvGen.kr(envDef);

	sig = SinOsc.ar(freq: freq) * env;
	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);

}).add;
)

Synth(\Boink);
s.plotTree



(
SynthDef(\Boink, {
	arg freq = 400, length = 1;
	var envDef, env, sig;

	// envelope definition
	envDef = Env.new(
		[0, 1, 0],
		[0.1, 0.9],
		[10, -10]
	);

	// as a control signal
	env = EnvGen.kr(envDef, timeScale: length);

	sig = SinOsc.ar(freq: freq) * env;
	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);

}).add;
)
(
SynthDef(\Boink, {
	arg freq = 400, length = 1;
	var envDef, env, sig;

	// envelope definition
	envDef = Env.new(
		[0, 1, 0],
		[0.05, 0.5],
		[10, -10]
	);

	// as a control signal
	env = EnvGen.kr(envDef, timeScale: length);

	sig = SinOsc.ar(freq: freq) * env;
	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);

}).add;
)

Synth(\Boink, [\length, 10]);
s.plotTree








// The Synths have not been cleared out. This creates a dangerous build-up of resources

//////////////////////////
// doneAction
//
// doneAction, tells a synth, to free itself, when it recogizes there is no more signal...!

(
SynthDef(\Boink, {
	arg freq=400, amp=1, length=1;
	var envDef, env, sig;

	// envelope definition
	envDef = Env.new(
		[0, 1, 0],
		[0.05, 0.5],
		[10, -10]
	);

	// as a control signal
	env = EnvGen.kr(envDef,
		levelScale: amp,
		timeScale: length,
		doneAction: 2 // <- doneAction: 2 => tells SC to free the synth, when there is no more signal
	);

	sig = SinOsc.ar(freq: freq) * env;
	sig = Pan2.ar(sig, 0);

	Out.ar(0, sig);

}).add;
)

Synth(\Boink, [length: 0.2]);
s.plotTree

rrand(20, 300)