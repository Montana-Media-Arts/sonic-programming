// simple amplitude modulation
{ SinOsc.ar( freq: 200 ) * SinOsc.kr(0.5).poll }.play;

// Poll mouse X UGen to the post window
{ MouseX.kr.poll }.play;
// use mouseX UGen to drive the amplitude of a sine wave
{ SinOsc.ar( freq: 200 ) * MouseX.kr.poll }.play;


// Use MouseX UGen to drive the frequency of a sine wave
{ SinOsc.ar(freq: MouseX.kr(20, 3000) ) }.play;
// Use Mouse X/Y to create a pseudo-theramin
{ SinOsc.ar( freq: MouseX.kr( 20, 2000 ), mul: MouseY.kr(0,1) ) }.play;



// Use amplitude modulation to create complex wave forms
{ SinOsc.ar( freq: 200 ) * SinOsc.kr(20).poll }.play;


// mouse driven complex amplitude modulation
{ SinOsc.ar( freq: MouseX.kr( 20, 2000 ) ) * SinOsc.ar(MouseY.kr(0, 100).poll ) }.play;