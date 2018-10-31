(
SynthDef(\whatever, {
	arg freq = 200, mul = 0.7;
	var sig;

	sig = SinOsc.ar(freq, mul: mul);

	// We must explicitly include an Out UGen
	Out.ar(0, sig!2);

}).add( );
)

// create multiple instances with different arguments
Synth(\whatever);
Synth(\whatever, args: [\freq, 400, \mul, 0.5]);
Synth(\whatever, [\freq, 1200, \mul, 0.1]);

// alter a running synth node
a = Synth(\whatever)
a.set(\freq, 400)
a.set(\mul, 0.01)
a.set(\freq, 1000, \mul, 0.05)
a.dump

// to get argument values
a.get(\freq, { arg value; ("freq is now:" + value + "Hz").postln; });

a.free


