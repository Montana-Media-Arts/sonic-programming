
// Reviewing basic Synth creation
(
{SinOsc.ar(freq: 200, mul: 0.3)}.play;
{SinOsc.ar(freq: 232, mul: 0.3)}.play;
{SinOsc.ar(freq: 376, mul: 0.3)}.play;
{SinOsc.ar(freq: 976, mul: 0.3)}.play
{SinOsc.ar(freq: 2000, mul: 0.3)}.play;
)
// use Cmd/Cntrl+. to kill all playing synths






///////////////////////////////////////////////
// Variables

/*
Variable, references some piece of data, for later use or retrieval
*/

(
// declare a namespace of 'val'
var val;

// assign a value to our namespace
val = 3;
// overwrite our namespace with a new value
val = 7;

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)



(
var val;
val = 1;
val = val * 2;
val = val**4;

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)




(
var val;
val = "Hello everyone.";

"".postln; "The value stored in 'value' is: ".post;
// post the value referenced in the variable
val.postln;
)


/////////////////////////////////////////////
// variables in synths
(
{
	// declare two variabes
	var sig, freq = 200;

	// assign the mouse value, to variable freq
	freq = MouseX.kr().range(200, 400);
	// create a signal, and assign it to variable 'sig'
	sig = SinOsc.ar(freq: freq, mul: 0.3);

	// output sig to speakers
	sig;
}.play;
)

/////////////////////////////////////////////
// Environmet Variable
/*
we can think of these as "global variables"

by default, the characters a-z, are assiged as envirnment variables

In addition, we can also create our own environment variables.
To do this, place a '~' in front.
i.e.
*/
(
a = {SinOsc.ar()}.play;
)

// I can now free the synth, more eloquently
a.free;


// this is useful when working with lots of synths
(
a = {SinOsc.ar(freq: 200, mul: 0.1)}.play;
b = {SinOsc.ar(freq: 232, mul: 0.1)}.play;
c = {SinOsc.ar(freq: 376, mul: 0.1)}.play;
d = {SinOsc.ar(freq: 976, mul: 0.1)}.play;
e = {SinOsc.ar(freq: 2000, mul: 0.1)}.play;
)
c.free
b.free
a.free
e.free
d.free


// In addition to the a-z, we can create environment variables by prepending a word with a '~'
~thisIsAnEnvrionmentVar

~der = 4;
~der

~der = ~der-8;
~der

~der = {SinOsc.ar()}.play;
~der.free;



///////////////////////////////////////////
///////////////////////////////////////////
// referencing variables later
(
// create a function, reference in 'a'
a = {
	SinOsc.ar();
}
)

// pass the play method to the function stored in 'a'
// pass a reference to the resulting synth, to the variable 'b'
b = a.play;
// free the synth referenced in 'b'
b.free;


/////////////////////////////////////////////////////////
// Synth Arguments
/*
A synth argument is a value which can be externally modified or added, at the time of instantiation, or while playing
*/

(
~synthFunc = {
	// arguments for synths are declared using the keyword 'arg'
	arg fr = 200, amp = 0.1;
	var sig;

	sig = SinOsc.ar(freq: fr, mul: amp);
}
)

// play the function stored in 'a'
~synthFunc.play;

// instantiate a new synth from the function stored in a
~synth1 = ~synthFunc.play(args: [\fr, 1000, \amp, 0.5]);
~synth2 = ~synthFunc.play(args: [\fr, 100]);
~synth3 = ~synthFunc.play(args: [\fr, 200]);

// change a synth's argument in real-time
~synth1.set(\fr, 2000)
~synth1.set(\fr, 4000)

~synth2.set(\fr, 100)
~synth1.set(\fr, 410)
~synth1.set(\amp, 0.6)
~synth2.set(\amp, 0.6)

~synth1.free;
~synth2.free;
~synth3.free;













////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


(
~synthFunc = {
	// arg
	var outSig, sig1, sig2, sig3, sig4;

	sig1 = SinOsc.ar(freq: 200);
	sig2 = SinOsc.ar(freq: 800);
	sig3 = SinOsc.ar(freq: 1200);
	sig4 = SinOsc.ar(freq: 1600);

	// additive synthesis
	outSig = sig1 + sig2 + sig3 + sig4;
	outSig = outSig * 0.1;

	outSig;
};

~synthFunc.play;
~synthFunc.plot(duration:1/200)
)


// using a moving frequency value
(
~synthFunc = {
	// arg
	var freq;
	var outSig, sig1, sig2, sig3, sig4;

	freq = MouseX.kr().range(200, 800);

	sig1 = SinOsc.ar(freq: freq);
	sig2 = SinOsc.ar(freq: freq * 2);
	sig3 = SinOsc.ar(freq: freq * 4);
	sig4 = SinOsc.ar(freq: freq * 8);

	// additive synthesis
	outSig = sig1 + sig2 + sig3 + sig4;
	outSig = outSig * 0.1;

	outSig;
};

~synthFunc.play;
~synthFunc.plot(duration:1/200)
)

(
~synthFunc = {
	arg freq = 200, amp = 0.001;
	// var freq;
	var outSig, sig1, sig2, sig3, sig4;

	sig1 = SinOsc.ar(freq: freq);
	sig2 = SinOsc.ar(freq: freq * 2);
	sig3 = SinOsc.ar(freq: freq * 4);
	sig4 = SinOsc.ar(freq: freq * 8);

	// additive synthesis
	outSig = sig1 + sig2 + sig3 + sig4;
	outSig = outSig * amp;

	outSig;
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:1/200)
)

~s1.set(\amp, 0.1, \freq, 100)



/////////////////////////////////
// Amplitude Modulation

(
~synthFunc = {
	arg freq = 200, amp = 0.3, modFreq = 1;
	// var freq;
	var outSig, cf, mf;

	// our modulation frequency
	// cereates side-band frequencies, which add complexity to the timbre
	mf = SinOsc.ar(
		freq: MouseX.kr().range(0.1, 1000).poll
	).range(0, 1);

	// carrier frequency => our percieved frequency
	// CF's amplitide is modulated by modulation frequency
	cf = SinOsc.ar(freq: freq) * mf;
	outSig = cf * amp;

	outSig;
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:1/200)
)

~s1.set(\modFreq, 10)
~s1.set(\freq, 220);



/////////////////////////////////
// Frequency Modulation

(
~synthFunc = {
	arg freq = 200, amp = 0.3, modFreq = 1;
	// var freq;
	var outSig, cf, mf;

	// our modulation frequency
	// creates side-band frequencies, which add complexity to the timbre
	mf = SinOsc.ar(
		freq: MouseX.kr().range(0.1, 400).poll
	).exprange(0.5, 2);
	mf = mf * 0.5;

	// carrier frequency => our percieved frequency
	cf = SinOsc.ar(freq: freq * mf);
	outSig = cf * amp;

	outSig;
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:1/200)
)

~s1.set(\modFreq, 10)
~s1.set(\freq, 220);


//////////////////////////////////////
// Classic BleepBloop Synth

/*
Using a step-based noise UGen, we can create our classic bleep-bloop synth
LFNoise.kr()
*/
// what does this look like?
{LFNoise0.ar(freq: 10)}.plot(duration: 1)

(
~synthFunc = {
	arg modFreq = 1, amp = 0.3;
	var freq;
	var outSig, sig;

	// create a new random value, at frequency value (times per second)
	// this will drive the frequency of the sin oscillator
	freq = LFNoise0.kr(freq: modFreq).exprange(250, 500);
	freq.poll;

	// carrier frequency => our percieved frequency
	sig = SinOsc.ar(freq: freq);
	outSig = sig * amp;

	outSig;
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:4)
)

~s1.set(\modFreq, 10)
~s1.set(\modFreq, 30)
~s1.set(\modFreq, 600)
~s1.set(\modFreq, 0)







//////////////////////////////////////
// MONO via Stereo

/*
To create a stereo signal, we need to expand our signal to both channels
*/

(
~synthFunc = {
	arg modFreq = 1, amp = 0.3;
	var freq;
	var outSig, sig;

	freq = LFNoise0.kr(freq: modFreq).exprange(250, 500);

	sig = SinOsc.ar(freq: freq);
	outSig = sig * amp;

	// if we duplicate the signal, as an array,
	// channel 0 => Left
	// channel 1 => Right
	// [ Left, Right ]
	[ outSig, outSig ];
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:4)
)

(
~synthFunc = {
	arg modFreq = 1, amp = 0.3;
	var freqL, freqR;
	var outSig, sig;

	freqL = LFNoise0.kr(freq: modFreq).exprange(250, 500);
	freqR = LFNoise0.kr(freq: modFreq).exprange(250, 500);

	sig = SinOsc.ar(freq: [freqL, freqR]);
	outSig = sig * amp;

	// if we duplicate the signal, as an array,
	// channel 0 => Left
	// channel 1 => Right
	// [ Left, Right ]
	outSig;
};

~s1 = ~synthFunc.play;
~synthFunc.plot(duration:4)
)