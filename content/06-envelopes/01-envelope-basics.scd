// Envelopes

// Envelopes wrap data in some sort of controlling "thing"



// starting with a basic sin example (no-enveolopes)
(
{
	var sig;

	sig = SinOsc.ar(200);

	Out.ar( 0, sig ! 2 );

}.play;
)


// use a `line` UGen to change amplitide
(
{
	var sig, env;

	env = Line.kr( start: 0, end: 1.0, dur: 4 );

	sig = SinOsc.ar(200) * env;

	Out.ar( 0, sig ! 2 );

}.play;
)

// opposite
(
{
	var sig, env;

	env = Line.kr( start: 1, end: 0, dur: 4 );

	sig = SinOsc.ar(200) * env;

	Out.ar( 0, sig ! 2 );

}.play;
)


// XLine (exponential line generator)
(
{
	var sig, env;

	env = XLine.kr( start: 2, end: 1, dur: 4 ) - 1;

	sig = SinOsc.ar(200) * env;

	Out.ar( 0, sig ! 2 );

}.play;
)


// applied to freq
(
{
	var sig, freq1, freq2;

	freq1 = Line.kr( start: 400, end: 200, dur: 4 );
	freq2 = XLine.kr( start: 400, end: 200, dur: 4 );

	sig = SinOsc.ar( [freq1, freq2] );
	sig.size.postln;

	Out.ar( 0, sig );

}.play;

)









// We can use envelopes to drive short time frames as well
// look at Decay

// impulse without decay
({
	var sig;
	sig = Impulse.ar(MouseX.kr(0.01, 100)) * 0.7;
	Out.ar(0, sig!2);
}.play;)

({
	var sig, freq;

	freq = MouseX.kr(0.01, 100);

	sig = Impulse.ar(freq) * 0.7;
	sig = Decay.ar(in: sig, decayTime: freq.linexp(0.01, 100, 1, 0.0001), mul: SinOsc.ar(400));



	Out.ar(0, sig!2);
}.play;)





