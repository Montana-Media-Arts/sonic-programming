
// create a dummy/basic pattern, using all default arguments.
a = Pbind().play;
// show that the pattern, wraps a routine
a.dump

// change the tempo
c = TempoClock.default
c.tempo = 120/60

// stop the pattern
a.stop;


// specify the freq to play
a = Pbind(\freq, 287).play;
// specify the mini note to play
a = Pbind(\midinote, 60).play;
// specify a note off of C4
a = Pbind(\note, 12).play;

// specify a different octave
a = Pbind(\note, 0, \octave, 4).play;
// change the base note of the scale
a = Pbind(\note, 0, \ctranspose, 7).play;


// Twinkle Twinkle
a = Pbind(\note, Pseq([0, 0, 7, 7, 9, 9, 7, 7, 5, 5, 4, 4, 2, 2, 0, 0], inf)).play;


// more complex and longer
(
a = Pbind(\note,
	// Pseq in a pseq
	Pseq([
		Pseq([0, 0, 7, 7, 9, 9, 7, 7, 5, 5, 4, 4, 2, 2, 0, 0], 1),
		Pseq([7, 7, 5, 5, 4, 4, 2, 2], 2),
				Pseq([0, 0, 7, 7, 9, 9, 7, 7, 5, 5, 4, 4, 2, 2, 0, 0], 1)
	], 1)

).play;
)

// alternate octaves every note
(
a = Pbind(
	\note, Pseq([0, 0, 7, 7, 9, 9, 7, 7, 5, 5, 4, 4, 2, 2, 0, 0], inf),
	\octave, Pseq([5, 6]+1, inf)

).play;
)



// use Prand instead of Pseq
Pbind(\freq, Prand([300, 500, 231.2, 399.2], inf), \dur, 0.1).play;

(
Pbind(
	\freq, Prand([300, 500, 231.2, 399.2], inf),
	\dur, Prand([0.1, 0.3], inf)
).play;
)