
// initalize midi
MIDIClient.init;

// connect midi devices to SC
MIDIIn.connectAll


// match any noteOn message
(
MIDIdef.noteOn(\noteOnTest, {
	arg ...args;
	args.postln;
},
(0..127)
); // match any noteOn
)

// specific midi value function
(
MIDIdef.noteOn(\noteOn_48, {
	arg ...args;

	("velocity is: " + args[0]).postln;
},
48
); // match any noteOn
)

// CC function def
(
MIDIdef.cc(\midiCC_test, {
	arg ...args;
	"cc".post;
	args.postln;

},
(0..127)
); // match cc 1-10
)

