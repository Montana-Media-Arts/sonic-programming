// SynthDefs & Synths

// shortcut method
({}.play)




// SYNTHDEF
/*
A SynthDef is a template for creating a synth node.
These are used by SCServer.
A Synth node is what SCServer uses to actually make sound.

We want to start explicitly defining Synth Definitions
and launching Synth Nodes from thise definitions.

This allows us;
- The ability to pass references of nodes to other nodes
- Control the initialization and removal of individual nodes
- more easily control arguments in running nodes
*/



/////////////////////////////////////////////////////////
// To define a SynthDef, use SynthDef()
(
SynthDef(\testWontWork, {
	var sig;
	sig = SinOsc.ar(200);
	Out.ar(0, sig!2);
}).add
);

// to play synth def
Synth(\testWontWork);