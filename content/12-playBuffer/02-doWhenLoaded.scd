




// with an action function
// note that the vars are not immediately up-to-date
(

b = Buffer.read(s, p,
	action: {
		arg buffer;
		("After update:" + buffer.numFrames).postln;
		x = { PlayBuf.ar(1, buffer, BufRateScale.kr(buffer)) }.play;
	}
);
("Before update:" + b.numFrames).postln;

)
x.free; b.free;




// synchronous and asynchronous execution
//
// -> synchronous, the line before finishes, then the next is executed.
// -> asynch, go do something and tell me when you finish