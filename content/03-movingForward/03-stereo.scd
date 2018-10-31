(
{
	var sig;

	sig = SinOsc.ar(300);

	// multi-channel expansion (the easy way)
	sig ! 2;
}.play;
)


(
{
	var sig;

	sig = SinOsc.ar(300);

	// multi-channel array (explicit) with 2 channels
	[sig, sig];

}.play;
)


// sep left/right
(
{
	var left, right;

	left = SinOsc.ar(200);

	right = Saw.ar(210, mul: 0.707);

	[left, right]
}.play;
)



// correct way of handling output
(
{
	var left, right;

	left = SinOsc.ar(200);

	right = Saw.ar(210, mul: 0.707);

	// Out.ar(0, [left, right]);
	Out.ar(0, right);
	Out.ar(1, left);
}.play;
)

// correct way of handling panning
(
{
	var sig;


	sig = Saw.ar(210, mul: 0.707);
	sig = Pan2.ar( sig, MouseX.kr(-1,1));

	Out.ar(0, sig);

}.play;
)