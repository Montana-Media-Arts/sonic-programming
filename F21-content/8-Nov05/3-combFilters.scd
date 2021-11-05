/*
Comb Filters



*/
o = s.options;
o.inDevice = "BIG KNOB STUDIO";
o.outDevice = "ZoomAudioD";
s.reboot;

(
{
	var sig, delaySig, delayT = 0.5, decayT = 1;

	// sig = Impulse.ar(1, mul: 2);
	sig = SoundIn.ar(0);

	//	delay time of 4 seconds, with a decay of 1000 seconds
	// this essentially creates a never-ending loop peddle
	// delayT = 4;
	// decayT = 1000;

	// determine the frequency for the comb filter
	delayT = MouseX.kr(400, 0).poll(label:\freq);
	// convert frequency to time / period (f = 1/p)
	delayT = (1 / delayT).poll(label: \delayT);

	// determine how long it takes to attenuate the delayed signal to nothing
	decayT = MouseY.kr(0, 4).poll(label:"decayT");




	// a comb filter OR delay (same thing)
	delaySig = CombN.ar(sig,
		maxdelaytime: 4,
		delaytime: delayT,
		decaytime: decayT
	);

	sig = Mix([sig, delaySig]);

	//
	sig = Limiter.ar(sig, -3.dbamp);
	sig = sig.dup;
	Out.ar(0, sig);
}.play;
)



// NOW WE SUBVERT THE FUCK OUT OF IT
(
a = {
	arg delayT = 1, decayT = 1000, lag = 10;
	var sig, delaySig;

	// sig = Impulse.ar(1, mul: 2);
	sig = SoundIn.ar(0);



	// a comb filter OR delay (same thing)
	delaySig = CombN.ar(sig,
		maxdelaytime: 40,
		delaytime: delayT.lag(lag),
		decaytime: decayT.lag(lag)
	);

	sig = Mix([sig, delaySig]);

	//
	sig = Limiter.ar(sig, -3.dbamp);
	sig = sig.dup;
	Out.ar(0, sig);
}.play;
)



a.set(\delayT, 4);
a.set(\delayT, 0.5);
a.set(\delayT, 20);
a.set(\delayT, 0.01);
a.set(\delayT, 4);

a.set(\lag, 0);
a.set(\lag, 0.1);
a.set(\lag, 1);
a.set(\lag, 10);