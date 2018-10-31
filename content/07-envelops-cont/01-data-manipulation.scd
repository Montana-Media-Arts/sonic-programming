// data manipulation techniques

// use .linlin method to map from (-1, 1) to (0, 0.1)
({
	var sig;
	sig = SinOsc.ar(0.1).linlin(-1, 1, 0, 0.1);
	Out.ar(5, sig);
}.play)


// Use the .range method to shortcut the above
({
	var sig;
	sig = SinOsc.ar(0.1).range(0, 10);
	Out.ar(5, sig);
}.play)


// Clip, limits the output range of a signal to the clip values.
({
	var sig;
	sig = SinOsc.ar(0.2, mul: 10);
	sig = sig.clip(1, 2);
	sig.poll;

	Out.ar(5, sig);
}.play;)