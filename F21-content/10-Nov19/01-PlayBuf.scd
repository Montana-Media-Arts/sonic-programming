/*

November 19th, PlayBuf


*/



PlayBuf



// read a whole sound into memory
// note: not *that* columbia, the first one
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"); // remember to free the buffer later.

// 'b' is now an instance of a buffer
b
b.dump

(
SynthDef(\help_PlayBuf, {
	arg out = 0, bufnum = 0, numFrames;
    Out.ar(out,
		PlayBuf.ar(bufnum.numChannels, bufnum, BufRateScale.kr(bufnum), startPos: numFrames)
    )
}).play(s, [\out, 0, \bufnum, b, \numFrames, b.numFrames]);
)



(
SynthDef(\help_PlayBuf, {
	arg out = 0, bufnum = 0, numFrames;
	var rateMod;


	rateMod = Pulse.kr(0.5, 0.5).poll;

    Out.ar(out,
		PlayBuf.ar(bufnum.numChannels, bufnum, BufRateScale.kr(bufnum)*rateMod, startPos: numFrames, loop: 1)
    )
}).play(s, [\out, 0, \bufnum, b, \numFrames, b.numFrames]);
)




(
SynthDef(\help_PlayBuf, {
	arg out = 0, bufnum = 0, numFrames;
	var rateMod, start;


	rateMod = SinOsc.kr(SinOsc.kr(0.2).range(0.01, 10)).range(-2, 2);

	start = SinOsc.kr(0.5).range(0,1) * numFrames;

    Out.ar(out,
		PlayBuf.ar(
			numChannels: bufnum.numChannels,
			bufnum: bufnum,
			rate: BufRateScale.kr(bufnum)*rateMod,
			trigger: Dust.kr(SinOsc.kr(0.2).range(0,40)),
			startPos: start,
			loop: 1,
			doneAction: 0
		)
    )
}).play(s, [\out, 0, \bufnum, b, \numFrames, b.numFrames]);

)

(
SynthDef(\help_PlayBuf, {
	arg out = 0, bufnum = 0, numFrames;
	var sig;

	sig =

    Out.ar(out,
		PlayBuf.ar(
			numChannels: bufnum.numChannels,
			bufnum: bufnum,
			rate: BufRateScale.kr(bufnum)*rateMod,
			trigger: Dust.kr(SinOsc.kr(0.2).range(0,40)),
			startPos: start,
			loop: 1,
			doneAction: 0
		)
    )
}).play(s, [\out, 0, \bufnum, b, \numFrames, b.numFrames]);

)