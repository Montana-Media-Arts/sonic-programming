
// Amplitude mod example 1
(
{
	SinOsc.ar( MouseX.kr(80, 320) ) *
	SinOsc.ar( MouseY.kr(0.01, 400), mul: 0.5, add: 0.5 );
}.play;
)



// Frequency Modulation (FM) Example 1
(
{
	// a carrier frequency is multiplied by a modulation frequency
	SinOsc.ar( 200 + (SinOsc.ar(MouseX.kr(0, 100).poll, mul: 0.5) * MouseY.kr(0,100) ) ) ;
}.play;
)



// Too-Much Modulation Example
(
{
	// a carrier frequency is multiplied by a modulation frequency
	SinOsc.ar( SinOsc.ar(200, mul: 50, add: 100) + (SinOsc.ar(MouseX.kr(0, 100).poll, mul: 0.5) * SinOsc.ar(40, mul: 50, add: 50) ) ) ;
}.play;
)



