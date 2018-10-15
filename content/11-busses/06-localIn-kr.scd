(
SynthDef(\controlFB, {
	arg micIn = 0;
	var sig, ampVal, krIn;

	sig = SoundIn.ar(micIn);

	krIn = LocalIn.kr();
	krIn = (krIn + 1).linexp(1, 2, 2, 1);
	krIn = ((krIn - 1) * 10) - 5;
	krIn.poll(label: \krVal);
	krIn.clip(0,1);

	sig = sig * Linen.kr(krIn);

	sig = Compander.ar(sig, sig, 0.1, 1.0, 1/3 ) * 1.8;
	ampVal = Amplitude.kr(sig).poll(label: \rawAmp);

	LocalOut.kr(ampVal);

	sig = Limiter.ar(sig, 0.9);


	Out.ar(0, sig);
}).play;
)


(
SynthDef(\controlFB, {
	arg micIn = 0;
	var sig, chain, centroid, ampVal, krIn;

	sig = SoundIn.ar(micIn);
	krIn = LocalIn.kr(2).poll;
	ampVal = krIn[1];
	centroid = krIn[0];

	sig = BRF.ar(sig, centroid, 0.9);
	sig = BRF.ar(sig, centroid, 0.01);

	sig = sig * (1 - ampVal.clip(0,1)).poll;

	chain = FFT(LocalBuf(2048), sig);
    centroid = SpecCentroid.kr(chain);
	ampVal = Amplitude.kr(sig, 0.001, 1);

	LocalOut.kr([centroid, ampVal]);

	sig = Limiter.ar(sig, 0.9);


	Out.ar(0, sig);
}).play;
)