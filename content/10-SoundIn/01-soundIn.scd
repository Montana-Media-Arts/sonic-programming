ServerOptions.devices;

o.device = "Scarlett 2i2 USB";
s.reboot;

(
{
	var inSig, sig;

	inSig = SoundIn.ar(0);

	sig = DelayC.ar(inSig, 4, 4);

	sig = Limiter.ar(sig, 0.707) ! 2;

	Out.ar(0, sig;)
}.play;
)