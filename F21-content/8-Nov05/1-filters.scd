/*

Filters

Nov 05

*/


// low pass filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");

	// filter the white noise signal
	sig = LPF.ar(sig, filter_freq);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

// high pass filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");

	// filter the white noise signal
	sig = HPF.ar(sig, filter_freq);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

// band pass filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");
	q = (MouseY.kr(1, 2, warp: -9) - 1).poll(label: "q");


	// filter the white noise signal
	sig = BPF.ar(sig, filter_freq, q);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

// band pass in left, resonz in right
({
	var sig, bp, res, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");
	q = (MouseY.kr(1, 2, warp: -9) - 1).poll(label: "q");


	// filter the white noise signal
	bp = BPF.ar(sig, filter_freq, q);
	res = Resonz.ar(sig, filter_freq, q);

	sig = [bp, res];
	// sig = res.dup;
	// sig = bp ! 2;

	Out.ar(0, sig);
}.play;

)

// band reject filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");
	q = (MouseY.kr(1, 20, warp: -9) - 1).poll(label: "q");


	// filter the white noise signal
	sig = BRF.ar(sig, filter_freq, q);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

////////////////////////////////////
// Resonant Filters

// resonant low pass filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");
	q = (MouseY.kr(1, 2, warp: -9) - 1).poll(label: "q");

	// filter the white noise signal
	sig = RLPF.ar(sig, filter_freq, q);

	// limit the sig
	sig = Limiter.ar(sig, -3.dbamp);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

// resonant high pass filter
({
	var sig, filter_freq, q;

	sig = WhiteNoise.ar(mul: -6.dbamp);

	filter_freq = MouseX.kr(20, 20000).poll(label: "cut off freq");
	q = (MouseY.kr(1, 2, warp: -9) - 1).poll(label: "q");

	// filter the white noise signal
	sig = RHPF.ar(sig, filter_freq, q);

	// limit the sig
	sig = Limiter.ar(sig, -3.dbamp);

	sig = sig.dup;

	Out.ar(0, sig);
}.play;

)

////////////////////////////

(
{
	var in, sig, freq;

	in = SoundIn.ar(0);

	// fundamental frequency estimation
	// this drives cutoff and resonant filter freq
	freq = Pitch.kr(in).poll;

	// filter mic signal
	sig = RLPF.ar(in, freq[0].lag(8), 0.01);
	// sig = RLPF.ar(PinkNoise.ar(0.7), freq, 0.001);
	sig = Limiter.ar(sig, -3.dbamp);
	sig = sig.dup;
}.play;
)