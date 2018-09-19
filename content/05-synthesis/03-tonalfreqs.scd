({

	var sig, note, freq;

	note = MouseX.kr(20, 100, warp: 0);
	note = note.floor.poll;

	(note%12).poll;

	freq = note.midicps;



	SinOsc.ar(freq, mul: 0.7);

}.play;

)