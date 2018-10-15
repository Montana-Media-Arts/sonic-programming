// Busses allow us to send audio and control signals between synths.

// To use busses, you must allocate them first.
// Allocation, tells the enginer to create ram for the storage of an signal.

~a1 = Bus.audio(s, 1);
~a1.dump;


ServerOptions.devices;

o.device = "Scarlett 2i2 USB";
s.reboot;

(
{
	var inSig, sig;

	inSig = SoundIn.ar(0);

	sig = DelayC.ar(inSig, 4, 0.5);

	sig = Limiter.ar(sig, 0.707) ! 2;

	Out.ar(~a1, sig;)
}.play;
)



({
	var busIn;

	busIn = In.ar(~a1);

	Out.ar(0, busIn);
}.play;)