(
{
    var in, chain;
    in = WhiteNoise.ar(0.1);
    chain = FFT(LocalBuf(2048), in);
	Out.ar(0, IFFT(chain)); // inverse FFT
}.play;
)


(
{
    var in, chain;
    in = SinOsc.ar(SinOsc.kr(SinOsc.kr(0.08,0,6,6.2).squared, 0, 100, 800));
    chain = FFT(LocalBuf(2048), in);
    IFFT(chain) ! 2
}.play;
)

(
{
    var in, chain;
	// in = SinOsc.ar(SinOsc.kr(SinOsc.kr(0.08,0,6,6.2).squared, 0, 100,800));
    //in = WhiteNoise.ar(0.2);
	in = SoundIn.ar(0);
	in = DelayC.ar(in, 4, 4);
	// in = CombC.ar(in, 1, 1, 10000);
    chain = FFT(LocalBuf(2048), in);
	chain = PV_MagAbove(chain, MouseX.kr(0, 1000).poll);
    IFFT(chain) ! 2;
}.play;
)

(
{
    var in, chain;
    in = WhiteNoise.ar(0.2);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall(chain, SinOsc.kr(0.1));
    IFFT(chain)
}.play;
)

(
{
    var in, chain;
    in = WhiteNoise.ar(0.8);
	chain = FFT(LocalBuf(2048), in);
    chain = PV_RandComb(chain, 0.95, Impulse.kr(0.4));
    IFFT(chain)
}.play;
)

(
{
    var in, chain;
    in = WhiteNoise.ar(0.2);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_RectComb(chain, 8, LFTri.kr(0.097,0,0.4,0.5),
        LFTri.kr(0.24,0,-0.5,0.5));
    IFFT(chain)
}.play;
)

(
{
    var in, chain;
    in = SinOsc.ar(LFNoise1.kr(5.2,250,400));
    chain = FFT(LocalBuf(2048), in);
    // moves in and out of freeze
    chain = PV_MagFreeze(chain, SinOsc.kr(0.2) );
    0.5 * IFFT(chain);
}.play;
)

(
{
    var in, chain;
	// in = SinOsc.ar(SinOsc.kr(SinOsc.kr(0.08,0,6,6.2).squared, 0, 100,800));
    //in = WhiteNoise.ar(0.2);
	in = SoundIn.ar(0);
	in = DelayC.ar(in, 4, 4);
	// in = CombC.ar(in, 1, 1, 10000);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagFreeze(chain, MouseX.kr(-1,1) );
    IFFT(chain) ! 2;
}.play;
)


// stereo example:

(
{
    var in, chain;
    in = SinOsc.ar(LFNoise1.kr([5.2, 3.3],250,400));
    chain = FFT({ LocalBuf(2048) } ! 2, in); // we need two buffers for stereo input.
    // moves in and out of freeze
    chain = PV_MagFreeze(chain, SinOsc.kr([0.2, 0.3]) );
    0.5 * IFFT(chain);
}.play;
)