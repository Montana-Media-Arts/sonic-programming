

~myTask = (
	Task({
		inf.do({
			Synth(\white_bursts);
			1.0.wait;
		});
	}).play;
)



// symbol

// always prepended with a backslash
// then followed with a single word (i.e. no spaces)
\iAmA_Symbol


[60, 65, 63, 62].midicps

TempoClock.default.beats
TempoClock.default.seconds


~t2 = TempoClock();

~t2

~t2.tempo * 60
~t2.beats;
~t2.elapsedBeats;
~t2.bar
~t2.beatDur
~t2.beatsPerBar
~t2.beatInBar
~t2.elapsedBeats
~t2.seconds
~t2.beats2secs


//

1.1.expexp(1.0, 2.0, 100.0, 200.0)




(
Env.new(
	levels: [ 0.1, 1, 0.1 ],
	times: [ 1, 1 ],
	curve: \cub).test.plot
)


===