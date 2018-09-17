(
a = {
	SinOsc.ar(400 + SinOsc.ar(240).linlin(-1,1,-300,800))
};

a.plot(0.1);
a.play;
)