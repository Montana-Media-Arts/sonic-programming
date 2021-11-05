(
a = {
	arg freq = 200;
	var sig, freq2;

	// freq = freq.lag(10);
	freq.poll;
	freq2 = freq.lag(4);
	freq2.poll;

	sig = SinOsc.ar([freq, freq2]);
	Out.ar(0, sig);
}.play;
)

a.set(\freq, 100);



(
{
	var sig;
	sig = Pulse.ar(80);

	sig = LPF.ar(sig, MouseX.kr(10000, 10, 8).poll);

	Out.ar(0, sig.dup);
}.play;
)

(
{
	var sig;
	sig = LFTri.ar(60);

	Out.ar(0, sig.dup);
}.play;
)

(
{
	var sig;
	sig = SinOsc.ar(60);

	Out.ar(0, sig.dup);
}.play;
)