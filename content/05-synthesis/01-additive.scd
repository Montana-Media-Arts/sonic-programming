/*
Additive and Subtractive Synthesis

*/


({
	arg baseFreq = 200;
	var sig1, sig2, sig3, sig4, sig5,  outSig;

	sig1 = SinOsc.ar( baseFreq, mul: 0.5 );
	sig2 = SinOsc.ar( baseFreq * 2, mul: 0.5 );
	sig3 = SinOsc.ar( baseFreq * 3, mul: 0.5 );
	sig4 = SinOsc.ar( baseFreq * 4, mul: 0.5 );


	outSig = Mix([sig1, sig2, sig3, sig4]);


	Out.ar( 0, outSig );
}.play)



// Sawtooth Wave
// Sawtooth wave: Add up n harmonics with amplitude falling off as 1/harmonicnumber, sign alternates between +1 and -1

(
{
	arg bFreq = 200;
	var n = 10;

	var wave = Mix.fill(4,{ arg i;

		var mult= ((-1)**i)*(0.5/((i+1))).postln;

		SinOsc.ar(bFreq*(i+1))*mult

	});

	Pan2.ar(wave/n,0.0); //stereo, panned centre

}.scope;
)



// Square wave: Sum of odd harmonics, no even, amplitude falls as off 1/harmonicnumber; closest 'real' waveform is a clarinet tone


(
{
	arg bFreq = 200;
	var n = 10;

	var wave = Mix.fill( 100,
		{
			arg i;
			var harmonicnumber = 2*i+1; //odd harmonics only
			SinOsc.ar( bFreq * harmonicnumber ) / harmonicnumber
		}
	)*0.25;

	Pan2.ar(wave,0.0); //stereo, panned centre

}.scope;
)


