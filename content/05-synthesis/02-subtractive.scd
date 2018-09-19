/*
Subtractive Synthesis
*/


// Various types of input noise
({
	var sig;

	sig = WhiteNoise.ar(0.707);
	// sig = PinkNoise.ar(0.707);
	// sig = BrownNoise.ar(0.707);
	// sig = GrayNoise.ar(0.707);
	// sig = ClipNoise.ar(0.707);
	sig = Dust.ar(3, 0.7);
}.play)

// Basic Low Pass Filter
({
	var sig;

	sig = BrownNoise.ar(MouseY.kr(0, 0.707));
	sig = LPF.ar( sig, freq: MouseX.kr( 100, 20000) );
}.play;)


// Resonant Low Pass Filter
// Notice how low 'q' creates a more distinguished resonant freq!
({
	var sig;

	sig = BrownNoise.ar(0.707);
	sig = RLPF.ar( sig, freq: MouseX.kr( 100, 18000).poll(label: \freq), rq: MouseY.kr(0.001, 0.99).poll(label: \rq) );
}.play;
)



({
	var sig;

	sig = PinkNoise.ar(0.707);
	sig = Resonz.ar( sig, freq: MouseX.kr( 100, 10000).poll(label: 'freq'), bwr: MouseY.kr(0.001, 10).poll(label: 'bwr') );
}.play;
)


({
	var sig;

	sig = WhiteNoise.ar(0.05);
	sig = Ringz.ar( sig, freq: MouseX.kr( 100, 10000).poll(label: 'freq'), decaytime: MouseY.kr(0.0000001, 1).poll(label: 'decayTime') );
}.play;
)


// straight bandpass

({
	var sig;

	sig = BrownNoise.ar(0.707);
	sig = BPF.ar( sig, freq: MouseX.kr( 100, 18000).poll(label: \freq), rq: MouseY.kr(0.001, 0.99).poll(label: \rq) );
}.play;
)

// straight bandreject
({
	var sig;

	sig = BrownNoise.ar(0.707);
	sig = BRF.ar( sig, freq: MouseX.kr( 100, 18000).poll(label: \freq), rq: MouseY.kr(0.001, 0.99).poll(label: \rq) );
}.play;
)




// Pass in LFNoise as source
({
	var sig;

	sig = LFNoise0.ar(1000, mul: 0.7);
	sig = Resonz.ar( sig, freq: MouseX.kr( 100, 10000).poll(label: 'freq'), bwr: MouseY.kr(0.001, 4).poll(label: 'bwr') );
}.play;
)