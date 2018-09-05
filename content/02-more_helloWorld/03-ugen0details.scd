//Hello World with Input Arguments

// a sine wave with freq -> 200Hz
{ SinOsc.ar( 200 ) }.play;

// with a named parameter syntax
{ SinOsc.ar( freq: 200 ) }.play;

// 'mul' is a multiplier to the output signal.
// almost all ugens (unit generators) and processing units have a mul argument optional
{ SinOsc.ar( freq: 200, mul: 0.5 ) }.play;
// this is the same as writing
{ SinOsc.ar( freq: 200 ) * 0.5 }.play;

