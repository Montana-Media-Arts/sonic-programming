// Starting to play in SC Land

// With Variable Frequency
{ SinOsc.ar(1600) }.play;


// With Explicit Parameter Name
{ SinOsc.ar( freq: 200 ) }.play;

// Include amp control
{ SinOsc.ar( 200, 0, 1.0 ) }.play;
{ SinOsc.ar( freq: 200, mul: 0.1 ) }.play;




// SynthDef Exploring Control Rate
{ MouseX.kr().poll }.play;

// Use A Control Rate UGen to Modulate Amplitude of a Sine Osc
{ SinOsc.ar( freq: 200, mul: MouseX.kr ) }.play;

// Applied to the output of the SinOsc
{ SinOsc.ar( freq: 200 ) * MouseX.kr  }.play;





// Applied to the freq parameter of the SinOsc
{ SinOsc.ar( freq: 80 + (400 * MouseX.kr), mul: 0.707 ) }.play;