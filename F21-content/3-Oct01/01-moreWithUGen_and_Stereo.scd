/////////////////////////////
/*
October 1st

*/
s.makeWindow

({
	var sig, freqArr;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: [200], mul: 0.3);
}.play;
)
({
	var sig, freqArr;

	// create a two channel signal, with freqs, 200 & 220
	sig = SinOsc.ar(freq: [200, 220], mul: 0.3);
}.play;
)


(
// create an array, that has 4 items
// for each item, create the value, as a function of the index value
4.collect({
		arg idx;
		 idx * 300 + 200
	});
)
// -> [ 200, 500, 800, 1100 ]


// create a complex signal, with four unique frequencies
(
a = {
	var sig, freqArr, outSig;

	freqArr = 4.collect({
		arg idx;
		 idx * 300 + 200
	});


	sig = SinOsc.ar(freq: freqArr, mul: 0.1);

	outSig = Mix(sig);

}.play;

)


// equivalent to
{SinOsc.ar(200, mul: 0.1)}.play;
{SinOsc.ar(500, mul: 0.1)}.play;
{SinOsc.ar(800, mul: 0.1)}.play;
{SinOsc.ar(1100, mul: 0.1)}.play;


// create a large array, then mix it down to a single channel signal
200.collect({
		arg idx;
		 idx * (200-idx) + 200
	});
///////////



({
	var sig, freqArr, outSig, arraySize = 7000;

	// create an array of 2000 values
	freqArr = arraySize.collect({
		arg idx;
		 idx**1.7 + 100
	});
	freqArr.postln;

	// create 2000 sin oscillators
	sig = SinOsc.ar(freq: freqArr, mul: 0.01);

	// mix them to a single channel signal
	outSig = Mix(sig);

}.play;

)






//////////////////////////////////////////////////////
// Panning

// Brute Force Panning
(
~synth = {
	arg left = 0, right = 1;
	var sig, freqArr;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: 200, mul: 0.3);
	sig = [sig * left, sig * right]
}.play;
)

~synth.set(\left, 1, \right, 0)
~synth.set(\left, 0, \right, 1)
~synth.set(\left, 1, \right, 1)
~synth.set(\left, 0.5, \right, 0.5)
~synth.set(\left, 0.707, \right, 0.707)
~synth.set(\left, -3.dbamp, \right, -3.dbamp)

-3.dbamp


//Pan2.ar
(
~synthDef = {
	arg panPos = 0, fr = 200;
	var sig, freqArr;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: fr, mul: 0.3);
	sig = Pan2.ar(sig, panPos);
	sig;

};
)

~synthDef.dump

~synth = ~synthDef.play;

~synth.set(\panPos, -1) // left
~synth.set(\panPos, 1) // right
~synth.set(\panPos, 0) // center
~synth.set(\panPos, -0.5) // somewhat left

~synth.set(\fr, 100);
~synth.set(\fr, 1000);



// or automate it
(
~synth = {

	var sig, freqArr, panPos;

	// panPos = SinOsc.kr(MouseX.kr(0, 10));
	panPos = MouseX.kr(-1, 1).poll;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: 200, mul: 0.3);
	sig = Pan2.ar(sig, panPos);
	sig;

}.play;
)


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
// Out

/*
We should be explicit in our decleration of where we want audio going out.
And what signal to use with what channel.
To do this, you should always use an Out UGen at the end of your SynthDef.

=> Out.ar(bus->what hardware output, channelArray->what signals)

*/

(
~synth = {
	arg outChan = 1;
	var sig;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: 200, mul: 0.3);

	// same as `[sig, sig]`
	// include the Out UGen
	Out.ar(outChan, sig);

}.play;
)


(
~synth = {
	var sig;

	// create a sinngle signal, with freqs 200
	sig = SinOsc.ar(freq: 200, mul: 0.3);
	sig = Pan2.ar(sig, 0);

	// same as `[sig, sig]`
	// include the Out UGen
	Out.ar(0, sig);

}.play;
)



