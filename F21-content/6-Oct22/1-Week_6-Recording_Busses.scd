/*
Week 6 Lecture Content

Recording in SC


*/


////////////////////////////////////////////////////
// -> From Help Documentation

s.boot; // start the server

// something to record
(
SynthDef("bubbles", { |out|
    var f, sound;
    f = LFSaw.kr(0.4, 0, 24, LFSaw.kr([8,7.23], 0, 3, 80)).midicps; // glissando function
    sound = CombN.ar(SinOsc.ar(f, 0, 0.04), 0.2, 0.2, 4); // echoing sine wave
    Out.ar(out, sound);
}).add;
)

x = Synth.new("bubbles");



////////
// s -> by default, assigned to the localhost server
s
s.dump // -> tells me it is an instance of server

// **USING CODE FOR RECORDING**
s.prepareForRecord; // if you want to start recording at a precise moment in time, you have to call this first.

s.record;

s.pauseRecording; // pausable

s.record // start again

s.stopRecording; // this closes the file and deallocates the buffer recording node, etc.

x.free; // stop the synths

// look in your recordings folder and you'll find a file named for this date and time




/////////////////
// Record Mic
(
SynthDef(\basicMicIn, {
	arg micInChan = 0, outChan = 0;
	var sig;

	sig = SoundIn.ar(micInChan);
	Out.ar(outChan, sig);
}).add;
)

x = Synth(\basicMicIn);

// use prepare for record if:
// 1. you need sample accurate start
// 2. you want to specify your own path
// 3. you want tp specify num of channels
s.prepareForRecord(path: "/Users/musick/Desktop/test_fromSC.aiff", numChannels: 2);
s.record;
s.stopRecording;

s.prepareForRecord(path: "/Users/musick/Desktop/test_fromSC_2.aiff", numChannels: 1);
s.record;
s.stopRecording;


// if you just need quick and dirty recording, you can JUST USE s.record
s.record

// its advantages to use SC's path, as it is date stamped, so will not forget to change th filename, and accidently overwrite something else



/// You can also shortcut with the Server menu down below

////////////////////////////////////////////////////
/* RECORD IN EXTERNAL DAW

To record in an external DAW, we can take one of two options.
1. hardwire an output from our computers audio interface to a hardware-based input on the same computer of another computer.
2. Utilize an inter-application audio routing interface/program.

We will examine the latter.

**FOR MAC**
Download either:
1. Blackhole - https://existential.audio/blackhole/
2.

**FOR PC**
1. https://vb-audio.com/Voicemeeter/index.htm
2. https://vb-audio.com/Cable/index.htm

// tell supercollider where to send audio
// SC, by default will use your system audio interface choices
*/

// will follow the system basec hoices for interfaces
s.reboot

// if I want to be explicit, I have to use ServerOptions
ServerOptions

// to set serrver options, execute the following:
o = s.options;
o.outDevice = "BlackHole 2ch";
s.reboot;



// now record in DAW
x = Synth.new("bubbles");