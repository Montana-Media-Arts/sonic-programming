/*

Tour of UGens

*/

// To look up documentation, place your cursor on a word and type "cmd + d" or "cntrl + d"
SinOsc



// Look Up "Tour of UGens"
Tour of UGens





///////////////////////////////////////////

// noise driven input freq
(
a = {

	var sig, carrFreq;

	carrFreq = LFNoise0.kr(2);
	// carrFreq = LFNoise1.kr(2);
	// carrFreq = LFNoise2.kr(2);


	carrFreq = carrFreq.linlin(-1, 1, 100, 400).poll;

	sig = SinOsc.ar(carrFreq, mul: 0.8);

	// output sig
	sig
}.play;
)


/////////////////////////////////////////////


(
// sinosc
a = {
	arg freq = 200;
	var sig;

	sig = SinOsc.ar(freq, mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)


(
// blip
a = {
	arg freq = 200;
	var sig;

	sig = Blip.ar(freq, mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)

(
a = {
	arg freq = 200;
	var sig;

	sig = Saw.ar(freq, mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)

(
a = {
	arg freq = 200;
	var sig;

	sig = Pulse.ar(freq, width: MouseX.kr(0,1), mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)

(
a = {
	arg freq = 200;
	var sig;

	sig = Klang.ar(`[ [freq*1, freq*2, freq*4], [0.3, 0.3, 0.3], nil], mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)


(
a = {
	arg freq = 200;
	var sig;

	sig = LFTri.ar(freq, width: MouseX.kr(0,1), mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)


(
a = {
	arg freq = 200;
	var sig;

	sig = LFPar.ar(freq, width: MouseX.kr(0,1), mul: 0.8);

	// output sig
	sig
};
a.plot(0.1);
a.play;
)

