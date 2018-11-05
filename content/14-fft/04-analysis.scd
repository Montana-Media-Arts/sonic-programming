// analysis


// spectral centroid -> mean of frequency spectrum
(
SynthDef(\specCent, {
	arg in = 0;
	var sig, chain, analysisVal;

	sig = SoundIn.ar(in);

	chain = FFT(LocalBuf(2048), sig);

	analysisVal = SpecCentroid.kr(chain);

	analysisVal.poll;

	Out.ar(0, sig);

}).play;
)



// Flux -> the amount of change between frames
// spectral centroid -> mean of frequency spectrum
(
SynthDef(\flux, {
	arg in = 0;
	var sig, chain, analysisVal;

	sig = SoundIn.ar(in);

	chain = FFT(LocalBuf(2048), sig);

	analysisVal = FFTFlux.kr(chain);

	analysisVal.poll;

	Out.ar(0, sig);

}).play;
)



// fundamental frequency
(
SynthDef(\fundFreq, {
	arg in = 0;
	var sig, freq, hasFreq;

	sig = SoundIn.ar(in);

	// this allows us to deal with multiple values (i.e. an array) as an output
	# freq, hasFreq = Pitch.kr(sig, ampThreshold: 0.02, median: 7);

	freq.poll;
	hasFreq.poll;


}).play;
)

// Amplitide tracking
(
SynthDef(\fundFreq, {
	arg in = 0;
	var sig, freq, hasFreq, amplitude;

	sig = SoundIn.ar(in);

	// this allows us to deal with multiple values (i.e. an array) as an output
	# freq, hasFreq = Pitch.kr(sig, ampThreshold: 0.02, median: 7);

	amplitude = Amplitude.kr(sig);

	freq.poll;
	hasFreq.poll;
	amplitude.poll;


}).play;
)




(
SynthDef("pitchFollow1", { |out|
	var in, amp, freq, hasFreq, sound;
	in = Mix.new(SoundIn.ar([0, 1]));
	amp = Amplitude.kr(in, 0.05, 0.05);
	# freq, hasFreq = Pitch.kr(in, ampThreshold: 0.02, median: 7);
	//freq = Lag.kr(freq.cpsmidi.round(1).midicps, 0.05);
	sound = Mix.new(VarSaw.ar(freq * [0.5, 1, 2], 0, LFNoise1.kr(0.3, 0.1, 0.1), amp));
	6.do {
		sound = AllpassN.ar(sound, 0.040, [0.040.rand,0.040.rand], 2)
	};
	Out.ar(out, sound);
}).play
)