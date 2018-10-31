

// change the number of notes in an octave
(
a = Pbind(
	\note, Pseq([0,1,2,3,4,5,6,7,8,9,10,11,12], inf),
	\stepsPerOctave, 4,
	\amp, -3.dbamp,
	\func, Pfunc{|ev| ev.use(ev[\freq]).postln }
).play;
)


// change the root of the scale
(
a = Pbind(
	\note, Pseq([0,1,2,3,4,5,6,7,8,9,10,11,12], inf),
	// up a perfect 5th
	\root, 7,
	\amp, -3.dbamp,
	\func, Pfunc{|ev| ev.use(ev[\freq]).postln }
).play;
)

// play a major scale
(
a = Pbind(
	\degree, Pseq([0,1,2,3,4,5,6,7], inf),
	// same as
	// \note, Pseq([0,2,4,5,7,9,11,12])
	\amp, -3.dbamp,
	\func, Pfunc{|ev| ev.use(ev[\freq]).postln }
).play;
)


// set a scale to use
(
a = Pbind(
	\scale, #[0,2,4,6,8,10],
	\degree, Pseq([0,2,1,3,2,4,3,5,4,6], inf),
	\amp, -3.dbamp,
	\func, Pfunc{|ev| ev.use(ev[\freq]).postln }
).play;
)

(
a = Pbind(
	\scale, #[0,2.5,5,7.5,10],
	\degree, Pseq([0,2,1,3,2,4,3,5,4,6], inf),
	\amp, -3.dbamp,
	\func, Pfunc{|ev| ev.use(ev[\freq]).postln }
).play;
)
