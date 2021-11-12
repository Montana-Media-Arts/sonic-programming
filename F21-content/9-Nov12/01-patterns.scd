// # Patterns

s.boot

/********************************** Overview **********************************/

// Patterns are some of the most expressive parts of the SuperCollider language.
// They allow a composer/programmer/musician to express complex musical patterns
// within a robust network of classes.  They are also some of the more challenging
// aspects for first-time users.  In addition to the notes for this course, I
// encourage you to read through the documentation below to further your
// understanding.


// [Pattern
//
// uide](http://doc.sccode.org/Tutorials/A-Practical-Guide/PG_01_Introduction.html)
//

// [The documentation on Pattern](http://doc.sccode.org/Classes/Pattern.html)

/************************************ Pbind ************************************/

// The simplest way to start organizing sound in time is with
// [Pbind](https://doc.sccode.org/Classes/Pbind.html).  Pbind is an example of a
// pattern.  Pbind creates repeated Synths on the server based on key-value pairs
// provided by the user.  In order to get going with a Pbind, we first need a
// SynthDef.


// The SynthDef below creates a simple sine wave with an amplitude envelope.  The
// final result is passed through [Pan2](https://doc.sccode.org/Classes/Pan2.html)
// which places a sound in the stereo field.  A pan position (i.e., `pos`) of -1
// places the sound completely in the left speaker, 0 in the middle and 1 on the
// right.  Any other value between -1 and 1 places the sound in some combination of
// the left and right speaker.  Important, `Pan2` takes a signal and returns an
// array of two signals: one for the left and one for the right.  Therefore, we do
// not need to create an array using the duplication operator.

(
SynthDef(\sine_tone, {
	arg outBus = 0, freq = 440, amp = 0.1, pos = 0, atk = 0.05, sus = 0.2, rel = 0.1;
	var sig, env;

	sig = SinOsc.ar(freq);
	env = EnvGen.kr(Env.linen(atk, sus, rel, amp), doneAction: 2);
	sig = Pan2.ar(sig * env, pos);

	Out.ar(outBus, sig);
}).add;
)

Synth(\sine_tone)

(
SynthDef(\white_bursts, {
	arg outBus = 0, freq = 440, amp = 0.1, pos = 0, atk = 0.05, sus = 0.2, rel = 0.1;
	var sig, env;

	sig = WhiteNoise.ar();
	env = EnvGen.kr(Env.linen(atk, sus, rel, amp), doneAction: 2);
	sig = Pan2.ar(sig * env, pos);

	Out.ar(outBus, sig);
}).add;
)



// Let's create a really simple Pbind.  A Pbind is simply a set of comma-separated
// key-value pairs.  When you use the `.play` method on a Pbind you create a new
// object an
// [EventStreamPlayer](https://doc.sccode.org/Classes/EventStreamPlayer.html).
// This is an object you can create like an audio file player.  You can pause,
// start, stop and resume the pattern as it plays.

(
~eventPlayer = Pbind(
	// key		// value
	// what instrument (aka. synthdef) will this pattern use?
	// it uses the `\sine_tone` synthdef
	\instrument, \sine_tone, // set the instrument
	// \instrument, \white_bursts, // set the instrument
	\dur, 0.5 // set the time in seconds between each instrument created
).play;
)

~eventPlayer.pause // Pause the player

~eventPlayer.resume // Resume the player

~eventPlayer.stop // Stop the player

~eventPlayer.play;

// Pbind can coordinate with a SynthDef's arguments and generate Synths with
// different arguments.  You must ensure though that the key of the Pbind matches
// an argument of the SynthDef.  Here we use the keys `\amp` and `\freq` to set the
// amplitude and frequency of each synth generated.  Note that our SynthDef has
// matching parameters for those keys.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone, // set the instrument
	\amp, 0.2, // set the amplitude for each synth generated to 0.2
	\freq, 300, // set the frequency for each synth generated to 300
	\dur, 0.5, // set the time between each instrument created
).play
)

~eventPlayer.stop

// **Your turn:**  Write a Pbind that plays the `\sine_tone` instrument from above
// with the following specifications:


// + amplitude: 0.2

// + frequency: 300

// + dur: 0.25

// + pos: -0.5 (this will make it come more out of the left speaker)

// + attack: 0.01

// + sustain: 0.1

// + release: 0.05


// Set the EventStreamPlayer returned by Pbind to a variable so you can stop it.
// Remember that the keys of the Pbind must match the arguments of the SynthDef.

// Your code here

(
~eventPlayer = Pbind(
	\instrument, \sine_tone, // set the instrument
	\amp, 0.2, // set the amplitude for each synth generated to 0.2
	\freq, 300, // set the frequency for each synth generated to 300
	\dur, 0.25, // set the time between each instrument created
	\pos, -1,
	\atk, 0.01,
	\sus, 0.1,
	\rel, 0.01
).play
)



// Write a line of code to stop the player.

// Your code here


/**********
* Events *
**********/

// Pbind generates [Events](https://doc.sccode.org/Classes/Event.html) at intervals
// specified by the `\dur` key.  What exactly is an event though?  An event is
// simply a dictionary of key-value pairs.

~e = (\instrument: \sine_tone, \amp: 0.2, \freq: 300)

~e.class.postln

// We can also play the event.  When an event is played, a Synth is generated on
// the server using the arguments specified as keys.

~e.play

// A keen eye will notice though that once we play this Synth, the post window
// seems to show other key-value pairs.  It turns out that events are a special
// kind of dictionary.  Every `Event` has a series of default key-value pairs that
// can be overriden as well as added.  For example, try to play the empty event
// below.  It will make a sound because it is relying upon default key-value pairs.

().play

// Below is a snippet of code to unearth some of those default values that are
// passed everytime an Event is played on the server.  There are quite a lot of
// them.

(
Event.parentEvents.default.keysValuesDo({
	|key, value|
	("Key:" + key.asString + " | Value:" + value.asString).postln;
})
)

// Most of the above keys are irrelevant **unless** they match a parameter to the
// SynthDef.  For example, one of the default keys is `\lag`.  Because our SynthDef
// does not have a parameter `\lag`, the `\lag` key-value pair will not impact the
// sound produced.


// In summary, Pbind generates events and overwrites/adds key-value pairs from the
// default values of the event.  For example in the Pbind above, the default
// key-value of `\instrument` was overwritten with the value `\sine_tone`.  The
// only key that operates specially is the `\dur` key which specifies the time
// until the next event should play.  `dur` itself has no impact on the sound
// generated by the synth.  The `dur` key is only relevant if the event is part of
// a stream of events like the EventStreamPlayer generated from the Pbind method
// `.play`.

// **Your Turn:** Play an event using our `\sine_tone` instrument from above by
// changing just the default attack and release to be 5 seconds each.  You should
// hear a long swell.

// Your code here


/************************
* Debugging Tip: Trace *
************************/

// Patterns can get complicated quickly.  There is a helpful method that can be
// applied to any pattern called `.trace`.


// Below shows an example of calling `.trace` on a Pbind.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\dur, 0.5,
).trace.play;
)

~eventPlayer.stop

// Note that we can also trace a specific key as well.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\dur, 0.5,
).trace(\dur).play;
)

~eventPlayer.stop;

/********************** Embedding Other Patterns in Pbind **********************/

// The power of patterns lie in their ability to embed other patterns within
// themselves.  Our pattern right now is relatively dull and boring.  It just plays
// the same sine wave at the same regular interval.  To introduce some more
// interest, let us embed a pattern.  To do so, first let's introduce the pattern
// Pseq.

/********
* Pseq *
********/

// The pattern [Pseq](https://doc.sccode.org/Classes/Pseq.html) generates a
// sequence of values from a list.  Pseq takes two arguments: the list and the
// number of times to repeat the list.  A pattern is a lazy evaluation.  Elements
// from the pattern are meant to be "pulled" one at a time.  A pattern by itself
// defines a sequence of values to be generated but needs to be converted into a
// stream to be usable.


// Below we define a pattern using Pseq.  Once converted to a stream, it will
// generate the number 100 followed by 200 twice.  If we pull from the stream
// anymore, then we will simply generate `nil`.

~p = Pseq([100, 200], 2) // The pattern will generate 100, 200, 100, 200, nil

// Convert the pattern to a stream and pull from the stream.

~stream = ~p.asStream // convert pattern to stream

~stream.next // Keep re-executing this cell to pull values

// Below write a `Pseq` and store it in a variable `~p` that produces the following
// pattern: 101, 102, 103, 101, 102, 103, 101, 102, 103.

// Your code here


~stream = ~p.asStream // convert pattern to stream

10.do({~stream.next.postln}) // should pull the correct pattern followed by `nil`

// Many patterns that are intended to repeat including `Pseq` can repeat
// indefinitely if given the keyword `inf`.

~stream = Pseq([1, 2], inf).asStream;

~stream.next // Will continually draw 1 followed by 2

/*************************
* Using Pseq in a Pbind *
*************************/

// `Pseq`, or any pattern for that matter, can be used as a value within Pbind.
// When Pbind generates the next event, the next value in any embedded pattern is
// pulled and added as the value for the key.  Here are the first 9 events
// generated from the pattern below:


// ```

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.5, 'atk': 0.01,

//   'amp': 0.2, 'freq': 400 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 800 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 600 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.5, 'atk': 0.01,

//   'amp': 0.2, 'freq': 400 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 800 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 600 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.5, 'atk': 0.01,

//   'amp': 0.2, 'freq': 400 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 800 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.1, 'atk': 0.01,

//   'amp': 0.2, 'freq': 600 )

// ( 'instrument': sine_tone, 'sus': 0.05, 'dur': 0.5, 'atk': 0.01,

//   'amp': 0.2, 'freq': 400 )

// ```

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.01,
	\sus, 0.05,
	\freq, Pseq([400, 800, 600], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play
)

~eventPlayer.stop

// Things can become more interesting when the patterns don't align perfectly.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.01,
	\sus, 0.05,
	\freq, Pseq([400, 800, 600, 500], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play
)

~eventPlayer.stop

// #### Sidenote: Trace for embedded patterns

// Recall that trace can be used to print out the values of pattern streams as they
// are pulled.  We can also use trace for embedded patterns if we like.  See below.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.01,
	\sus, 0.05,
	\freq, Pseq([400, 800, 600, 500], inf).trace,
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play
)

~eventPlayer.stop
~eventPlayer.dump

/*********
* `nil` *
*********/

// Once a value in a key-value pair is `nil`, Pbind will automatically stop the
// pattern.  For example, below the pattern for `freq` will generate four numbers
// and then generate `nil`.  Therefore, only four events will be created.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.01,
	\sus, 0.05,
	\freq, Pseq([400, 800, 600, 500], 1), // will generate 400, 800, 600, 500 and then `nil`
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).trace.play
)

// Note that we don't need to stop the player because `nil` will do that for us
// once the pattern is exhausted.

/*********
* Rests *
*********/

// Rests can be embedded in patterns to indicate silence just as a rest would in
// notated music.  A rest can be the value for any key in a pattern and the silence
// will occur.  To notate a rest, simply write `Rest()`.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.1,
	\atk, 0.01,
	\sus, 0.1,
	\freq, Pseq([400, 800, 600, 500, Rest()], inf), // play four notes, rest for 0.1 and repeat
	\dur, 0.1
).play
)

~eventPlayer.stop

// If the rest is used as a value in the `\dur` key, then one can pass an argument
// specifying the length to rest.


(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.1,
	\atk, 0.01,
	\sus, 0.1,
	\freq, Pseq([400, 800], inf), // play four notes, rest for 0.1 and repeat
	\dur, Pseq([0.25, 0.25, Rest(0.5)], inf)
).trace.play
)


~eventPlayer.stop

/*****************************
* Pwhite: Adding Randomness *
*****************************/

// The pattern [Pwhite](https://doc.sccode.org/Classes/Pwhite.html) can be used to
// generate random values between some lower value and upper value.  If the
// arguments are **integers**, then the random value is an integer.  If the
// arguments are **floats**, then the random value is float.

~p = Pwhite(0.0, 1.0, inf) // lower bound as float, upper bound as float, number of repeats

~stream = ~p.asStream

~stream.next

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.8),
	\atk, 0.01,
	\sus, Pwhite(0.1, 0.5),
	\freq, Pseq([400, 800, 600, 500], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play
)

~eventPlayer.stop

// Pwhite draws numbers from a uniform distribution but there are other
// distributions you can draw from including exponential and gaussian.  See the
// classes Pexprand, Pgauss, Phprand, Plprand and others.

/********************************** Exercises **********************************/

/**********
* Swells *
**********/

// Write a Pbind that plays back the frequencies of an A major chord in infinite
// succession (440Hz, 550Hz, 660Hz, 880Hz).  Make the attack and decay long (around
// 4 seconds) and randomize the duration from one note to the next using `Pwhite`.
// I kept the duration between 1-4 seconds.

// Your code here


~swell.stop

/********
* Kids *
********/

// Write a pattern that plays the following musical excerpts using the SynthDef
// `\sine_tone` above.  It's helpful to think of these notes in terms of their MIDI
// number.  In this system, every note is assigned a unique integer value.  For
// example, the first G is assigned the integer 67.  The G#/Ab above that is 68 and
// so on and so forth.  Here, you can create a `Pseq` of MIDI note numbers that
// will be converted to frequency like so: `Pseq([67, 69]).midicps`.  These are the
// first two notes of the melody below.


// ![](melody.png)

// Your code here


// Your code here


/**************************** Frequency in Events ****************************/

// If we look at the previous examples, it is easy to see that the frequency
// `\freq` of the Pbind matches the frequency argument from the SynthDef
// `sine_tone`.  The example below though should seem perplexing then if we switch
// the Pbind key from `\freq` to `\midinote`.  Seemingly this should not work.
// `sine_tone` does not have an argument `midinote`.  But it does work.  So what is
// going on?

(
// Why is this producing sound?

~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([60, 65, 63, 62], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play
)

~eventPlayer.stop

// Is this Pbind producing a value for the key `freq`?

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([60, 65, 63, 62], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).trace(\freq).play
)

~eventPlayer.stop

// It turns out that there is a complex web of keys that work together to produce
// the frequency.  See the bottom of the
// [Event](https://doc.sccode.org/Classes/Event.html) page for more details.
// Essentially, the default keys will work behind the scenes to produce the correct
// frequency.  As a user, you can think about your pitches in different terms (MIDI
// notes, frequency, or scale degrees) depending upon the application.  Behind the
// scenes each event will calculate the correct frequency.  The image below shows
// the details:


// ![pitch_keys.png](pitch_keys.png)

// For all this to run correctly, you need to ensure that your SynthDef has the
// argument `freq`.  In general it's best to work at one "level".  Think about your
// notes in either frequency, midi note, or scale degrees.  But don't mix and
// match.  That will usually lead to unexpected outcomes as each level is derived
// from the values of the previous level.  Notice, for example, how the key `\freq`
// comes from the key `\midinote`.


// Another visualization of those levels:
// ![pitch_hierarchy.png](pitch_hierarchy.png)

/*********************************** Clocks ***********************************/

// Much music is governed by a consistent tempo.  Traditional Western-European
// music adheres to a tempo defined in a score.  But plenty of other cultures from
// Africa, the Carribean, Asia, and South America create music with a constant
// pulse.


// In SuperCollider, we can use clocks to create a pulse and the `dur` key to
// define the rhythmic content.  The class
// [TempoClock](https://doc.sccode.org/Classes/TempoClock.html) defines a clock
// with a tempo measure in beats per second.  Generally, we think of tempo in beats
// per minute.  Therefore, I typically write a tempo in bpm and divide by 60 to
// convert to beats per second.

(
var bpm = 120;
~clock = TempoClock(bpm/60); // convert the tempo to beats per second for TempoClock
)



// Now that we have defined a clock, we can play a Pbind using that clock.  The
// `dur` key represents the elapsed time in beats relative to the clock.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([60, 65, 63, 62], inf),
	\dur, Pseq([1, 0.5, 0.25, 0.25], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock);
)

~eventPlayer.stop

/****************
* Quantization *
****************/

// Clocks also come with the ability to quantize the pattern to a particular
// multiple of the beat.  Quantization is an important concept in music technology
// that extends to various different concepts.  In general quanitzation is the
// process of mapping a larger set of values to a smaller set.


// When we run the code above we are executing it instantly on the clock.  But that
// moment of execution could be anywhere in the clock's pulse.  It could be on beat
// 3.714, for example.  Generally, we like patterns to start at the beginning of a
// measure or on the beat, not on some fractional beat.  To ensure that we can use
// quantization to enfore our patterns to align with a clock's beat or measure.

(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([60, 65, 63, 62], inf),
	\dur, Pseq([1, 0.5, 0.25, 0.25], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock, quant: 4);
)

~eventPlayer.stop;

// Quantization is useful when we need multiple patterns to align.  Execute the
// cells below at your own leisure.  The quantization will each pattern to align to
// a measure.  Note that you may hear some delay between the time you execute the
// pattern and when you hear it.  The pattern needs to wait for the beginning of
// the next measure.



(
~eventPlayer1 = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([60, 65, 63, 62], inf),
	\dur, Pseq([1, 0.5, 0.25, 0.25], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock, quant: 4);
)




(
~eventPlayer2 = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([72, 77, 79], inf),
	\dur, Pseq([0.25, 0.25, 0.25], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock, quant: 4);
)

(
~eventPlayer3 = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.2, 0.22),
	\atk, 0.01,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Pseq([48, 51, 55, Rest(), 51], inf),
	\dur, Pseq([0.75, 0.75, 1, 0.5, 1], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock, quant: 4);
)

(
~eventPlayer1.stop;
~eventPlayer2.stop;
~eventPlayer3.stop;
)
~eventPlayer1.play(quant: 4);
~eventPlayer2.play(quant: 4);
~eventPlayer3.play(quant: 4);

/************************************ Pkey ************************************/

// In many instances it is useful to reference the values from other keys.  To do
// so, we use the pattern called [Pkey](https://doc.sccode.org/Classes/Pkey.html).
// If we pass in a key from an earlier event variable, we can get its value.

(
// For your next horror movie
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\atk, 2,
	\sus, 3,
	\rel, 4,
	\freq, Pexprand(100, 7000), // choose from an exponential distribution
	\amp, Pkey(\freq).expexp(400, 7000, 0.05, 0.01), // make the higher frequencies softer
	\dur, 0.1,
	\pos, Pwhite(-1, 1) // Play each sine tone randomly across stereo field
).trace.play;
)

~eventPlayer.stop

// **IMPORTANT**: `Pkey` must be used after the key referenced.  Therefore, it
// matters that our `\amp` key is calculated after our `\freq` key.

/******************************* Other Patterns *******************************/

/*********
* Prand *
*********/

// SuperCollider excels at creating algorithmic compositions.  To give algorithmic
// music more interest, we often use randomness to add surprise and
// unpredictability.  There are several patterns devoted to randomness.
// [Prand](https://doc.sccode.org/Classes/Prand.html) is the most common.


// Prand chooses randomly from a list.  The second argument to Prand is the number
// of times to repeat.

~p = Prand([1, 2, 7], 5)

~stream = ~p.asStream

~stream.next // Execute 5 times, the 6th time will be nil

// Here is an example where notes are chosen randomly.

(
var bpm = 180;
~clock = TempoClock(bpm/60);

~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.002,
	\rel, 0.05,
	\sus, 0.1,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Prand([60, 63, 65, 70], inf), // cm7
	\dur, Pseq([0.25, 0.125, 0.5, 0.25, 0.25, Rest(0.125)], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock);
)

~eventPlayer.stop

// We can also add patterns together.  Here is an example where the second Prand
// draws either 0, 12, or -12 to change the octave of the midinote.

(
var bpm = 180;
~clock = TempoClock(bpm/60);

~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pwhite(0.1, 0.12),
	\atk, 0.002,
	\rel, 0.05,
	\sus, 0.1,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Prand([60, 63, 65, 70], inf) + Prand([0, 12, -12], inf), // two patterns added together
	\dur, Pseq([0.25, 0.125, 0.5, 0.25, 0.25, Rest(0.125)], inf) // quarter, eigth, two sixteenths at 120 bpm
).play(~clock);
)

~eventPlayer.stop

/********
* Pseg *
********/

// [Pseg](https://doc.sccode.org/Classes/Pseg.html) is a "time-based pattern".
// When it is embedded into a Pbind, it operates independently of when an event is
// created.  Pseg is a great to tool to change aspects of a pattern dynamically
// over time for things like fade-ins and fade-outs or sweeping a filter.


// Pseg takes a list of levels, a list of durations, a list of curves, and the
// number of times to repeat.  Pseg is typically used as an embedded pattern within
// something like a Pbind that uses a clock.  The list of durations state how long
// it takes in beats based on the clock's tempo to move from one level to another
// level.  When a clock is not explicity provided to Pbind's `play`, there is
// actually a default clock used at 60bpm.  Therefore, Pseg will still work.  The
// beats then can be understood simply as seconds.


// In the example below, the `Pseg` moves the amplitude from 0 to 0.3 linearly
// across 5 beats and then back down to 0 linearly across 5 seconds.  The pattern
// repeats itself infinitely.

(
var bpm = 180;
~clock = TempoClock(bpm/60);

~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, Pseg([0, 0.3, 0, 0], [2, 10, 5], ['lin', 'lin'], inf),
	\atk, 0.002,
	\rel, 0.05,
	\sus, 0.1,
	\sus, Pwhite(0.05, 0.1),
	\midinote, Prand([60, 63, 65, 70], inf) + Prand([0, 12, -12], inf), // two patterns added together
	\dur, Pseq([0.25, 0.125, 0.5, 0.25, 0.25, Rest(0.125)], inf) // quarter, eigth, two sixteenths at 120 bpm
).trace(\amp).play(~clock);
)
(
~eventPlayer = Pbind(
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.002,
	\rel, 0.05,
	\sus, 0.1,
	\sus, 0.1,
	\midinote, Pseg([60, 72, 60, 60], [3, 7, 4], repeats: inf), // two patterns added together
	\dur, Prand([1, 2, 4, 0.25], inf) // quarter, eigth, two sixteenths at 120 bpm
).trace(\midinote).play();
)

~eventPlayer.stop

/*********
* Pfunc *
*********/

// When SuperCollider's provided patterns do not meet your needs,
// [Pfunc](https://doc.sccode.org/Classes/Pfunc.html) is the way to create any kind
// of pattern using a function.  This function optionally takes in the current
// event as an argument.  Therefore, you can access any of the keys in the
// dictionary declared **prior** to the instance of Pfunc.  For example, below the
// Pfunc could not access the `\pos` key.


// For each event generated from the Pbind, the function inside Pfunc will be
// called to pull the next value.

(
var bpm = 180;
~clock = TempoClock(bpm/60);

~eventPlayer = Pbind(*[
	\instrument: \sine_tone,
	\amp: Pwhite(0.1, 0.15),
	\atk: 0.002,
	\rel: 0.05,
	\sus: 0.1,
	\sus: Pwhite(0.05, 0.1),
	\midinote: Prand([60, 63, 65, 70], inf) + Prand([0, 12, -12], inf),
	\dur: Pfunc({
		|eventDic| // the event dictionary is passed in for the current event
		~dumEvent = eventDic;
		if(eventDic[\midinote] == 77, {3}, {0.01})
	}),
	\pos: Pwhite(-0.7, 0.7)]
).trace(\dur).trace(\midinote).play(~clock);
)

~eventPlayer.stop

~dumEvent[\midinote]

// read about Dictionary's in help docs
Dictionary

/********************************** Pbindef **********************************/

// While patterns can wonderfully encapsulate repetition in musical structures,
// many patterns need to be updated over time.  Unfortunately, a Pbind can not be
// changed dynamically.  Fortunately, there is a corollary to Pbind that can be
// updated incrementally: [Pbindef](https://doc.sccode.org/Classes/Pbindef.html).


// Pbindef works exactly like Pbind except it takes one extra argument at the
// beginning which is the name of the pattern.  Note that Pbindef also creates an
// event stream player and stores it as one of its internal variables (sometimes
// called instance variables) but the object returned is actually the Pbindef and
// not the player.  Functionally you can use it just the same as before.

(
~pbindef = Pbindef(
	\sine_pat,
	\instrument, \sine_tone,
	\amp, 0.2,
	\atk, 0.01,
	\sus, 0.05,
	\freq, Pseq([400, 800, 600, 500], inf),
	\dur, Pseq([0.5, 0.1, 0.1], inf)
).play;
)

// While the pattern is running, we can make some incremental changes.  Let's
// update the frequencies.  Here we need to pass the name of the pattern and then
// the key/values we want to change.

Pbindef(\sine_pat, \freq, Prand([300, 400, 1000, 1400], inf))

Pbindef(\sine_pat, \amp, 0.4)

Pbindef(\sine_pat, \dur, Pwhite(0.04, 0.2))
Pbindef(\sine_pat, \dur, 0.1)

Pbindef(\sine_pat).stop

// An important thing to note is that SuperCollider keeps a global reference of all
// the patterns playing/stopped.  It is typically a good idea to clear out all
// references to old Pbindefs if you intend to replay the pattern.  In certain
// scenarios, this can lead to strange behavior if you are not careful.

Pbindef.clear

/******************** Working with Audio Files and Busses ********************/

// We can also use audio files and organize them in patterns.  This example will
// uses samples from a drum kit.  To get started, we first need to get the path of
// the folder that has the drum kit files.

(
// Define a variable called ~kit_folder_path and set it to the path of the kit folder that came with this code
// Your code here

)

// If you are running from the SuperCollider IDE you can easily get the path to the
// folder by running the cell below.

~kit_folder_path = thisProcess.nowExecutingPath.dirname +/+ "kit"

// Run the code below to add several audio files to buffers for our drum kit.

(
~snare_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3Snr-01.wav");
~hihat_open_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3OpHat-02.wav");
~hihat_closed_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3ClHat-02.wav");
~kick_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3Kick-03.wav");
~crash_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3Crash-07.wav");
~tom1_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3Tom-01.wav");
~tom2_buf = Buffer.read(s, ~kit_folder_path +/+ "CyCdh_K3Tom-04.wav");
)

// We will need a SynthDef to playback those buffers.

(
SynthDef(\play, {
	arg outBus = 0, buf, amp = 1;
	var sig = PlayBuf.ar(2, buf, rate: 1, doneAction: 2);
	Out.ar(outBus, sig * amp);
}).add
)

Synth(\play, [\buf, ~snare_buf])

Synth(\play, [\buf, ~hihat_open_buf])

Synth(\play, [\buf, ~hihat_closed_buf])

Synth(\play, [\buf, ~kick_buf])

Synth(\play, [\buf, ~crash_buf])

Synth(\play, [\buf, ~tom1_buf])

Synth(\play, [\buf, ~tom2_buf])

// Let's make a simple bass drum (also sometimes called a kick drum on a drum set)
// pattern below.

(
var bpm = 120;
~clock = TempoClock(bpm/60);

~bass = Pbind(
	\instrument, \play,
	\buf, ~kick_buf,
	\dur, 1
).play(~clock)
)

~bass.stop

// Here we put a kick drum pattern together with a snare pattern and sync them
// using `quant`.

(
var bpm = 120;
~clock = TempoClock(bpm/60);

~bass = Pbind(
	\instrument, \play,
	\buf, ~kick_buf,
	\outBus, ~bus,
	\dur, 1
).play(~clock, quant: 4);

~snare = Pbind(
	\instrument, \play,
	\buf, ~snare_buf,
	\outBus, ~bus,
	\dur, Pseq([Rest(1), 1, Rest(1), 1], inf)
).play(~clock, quant: 4)
)

(
~bass.stop;
~snare.stop;
)

// Below write a drum pattern using some of the other buffers.  Create a clock and
// use the clock and `quant` to sync each pattern together like above.

// Your code here


// Write some code to stop your drum pattern from above.

// Your code here


(
SynthDef(\reverb, {
	arg outBus = 0, inBus, mix = 0.4;
	var sig;

	sig = In.ar(inBus, 2);
	sig = FreeVerb.ar(sig, mix, room: 0.5);

	Out.ar(outBus, sig);
}).add;
)

(
~bus = Bus.audio(s, 2);
~reverb = Synth(\reverb, [\inBus, ~bus, \mix, 0.08]);
)

// Your code here


~reverb.set(\mix, 0.8) // bring in more reverb

CmdPeriod.run

// The End!

