
// play chords (synth expansion)
a = Pbind(\note, Pseq([ [0, 7], [0, 5], [0, 1] ], inf)).play

// change duration with '\dur'
(
a = Pbind(
	\note, Prand([0, 7, 5], inf),
	\dur, Prand([1, 0.5, 0.25], inf)
).play
)



(
a = Pbind(
	// Pseq in a pseq
	\note, Pseq([
		Pseq([0, 0, 7, 7, 9, 9, 7, 5, 5, 4, 4, 2, 2, 0], 1),
		Pseq([7, 7, 5, 5, 4, 4, 2], 2),
		Pseq([0, 0, 7, 7, 9, 9, 7, 5, 5, 4, 4, 2, 2, 0], 1)
	], 1),
	\dur, Pseq([
		Pseq([1,1,1,1,1,1,2,1,1,1,1,1,1,2], 1),
		Pseq([1,1,1,1,1,1,2], 2),
		Pseq([1,1,1,1,1,1,2,1,1,1,1,1,1,2], 1)
	])
).play;
)



// change AMPLITUDE with '\amp'
(
~note = 0;
a = Pbind(
	\note, Pfunc({~note = ~note + 5.rand; if(~note >= 24, {~note=0}); ~note}),
	\dur, Prand([1, 0.5, 0.25], inf),
	\amp, Pseq([0.0.dbamp, -3.dbamp, -6.dbamp, -9.dbamp, -12.dbamp], inf),
	// a function to execute every iteration.
	// The result of the function is passed to the synth
	\pan, Pfunc({1.0.rand2})
).play
)