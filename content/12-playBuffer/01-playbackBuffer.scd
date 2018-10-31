// read a soundfile
s.reboot;
p = Platform.resourceDir +/+ "sounds/a11wlk01.wav";
p = "/Users/musick/Downloads/michael_musick.wav"
// load the soundfile into memory
b = Buffer.read(s, p);
b.dump

// now play it
(
SynthDef(\playbackBuffer, {
	arg out = 0, bufnum;
    var sig;

	sig = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: BufRateScale.kr(bufnum) * MouseX.kr(-2, 100).poll(trig: 1.0),
		trigger: 1.0,
		startPos: 0.0,
		loop: 1.0,
		doneAction: 0
	);

	Out.ar(out, sig);

}).add;
)
// play the synth
x = Synth(\playbackBuffer, args: [\bufnum, b]);
x.set(\bufnum, 1);


// ALWAYS FREE BUFFER AFTER FINISHING WITH IT!!!!
x.free; b.free;



// now play it
(
x = SynthDef(\playbackBuffer, {
	arg out = 0, bufnum, length;
    var sig, sig2, pbRate;

	pbRate = SinOsc.ar(
		LFNoise0.kr(LFNoise0.kr(1).linlin(-1,1,0.01,2)).linlin(-1,1, 0.5, 5)
	).linlin(-1,1,-2,4);


	sig = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: BufRateScale.kr(bufnum) * pbRate,
		trigger: Dust.kr(2),
		startPos: LFNoise0.kr(1).linlin(-1,1,0, length),
		loop: LFNoise0.kr(0.25).linlin(-1,1,0,1).round,
		doneAction: 0
	);



	sig2 = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: BufRateScale.kr(bufnum) * pbRate,
		trigger: Dust.kr(2),
		startPos: LFNoise0.kr(1).linlin(-1,1,0, length),
		loop: LFNoise0.kr(0.25).linlin(-1,1,0,1).round,
		doneAction: 0
	);

	sig = Mix([sig, sig2]);

	// sig = sig * SinOsc.ar(20, mul: 0.5, add: 0.5 );
	sig = FreeVerb.ar(sig, 0.2, 0.9, 0.1);


	Out.ar(out, sig);

}).add;
)

x = Synth(\playbackBuffer, [\bufnum, b, \length, b.numFrames])

x.free; b.free;










