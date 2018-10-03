// Routine

// create a routine

a = Routine.new( { 1.yield; 2.yield; } );
a.dump;
// step through the routine
a.next.postln;
a.next.postln;
// nothing left to step through
a.next.postln;


(
a = Routine { arg inval;
    inval.postln;
}.value("hello routine");
)



///////////////////////

(
var r, outval;
r = Routine.new({ arg inval;
    ("->inval was " ++ inval).postln;
    inval = 1.yield;
    ("->inval was " ++ inval).postln;
    inval = 2.yield;
    ("->inval was " ++ inval).postln;
    inval = 99.yield;
});

outval = r.next('a');
("<-outval was " ++ outval).postln;
outval = r.next('b');
("<-outval was " ++ outval).postln;
r.reset; "reset".postln;
outval = r.next('c');
("<-outval was " ++ outval).postln;
outval = r.next('d');
("<-outval was " ++ outval).postln;
outval = r.next('e');
("<-outval was " ++ outval).postln;
outval = r.next('f');
("<-outval was " ++ outval).postln;
)










////////////////////


(
r = Routine {
    10.do({ arg a;
        a.postln;
        // Often you might see Wait being used to pause a routine
        // This waits for one second between each number
        1.wait;
    });
    // Wait half second before saying we're done
    0.5.wait;
    "done".postln;
}.play;
)


(
r = Routine {


	0.postln; 1.wait;
	1.postln; 1.wait;
	2.postln; 1.wait;
	3.postln; 1.wait;
	4.postln; 1.wait;
	5.postln; 1.wait;
	6.postln; 1.wait;
	7.postln; 1.wait;
	8.postln; 1.wait;
	9.postln; 1.wait;

    // Wait half second before saying we're done
    0.5.wait;
    "done".postln;
}.play;
)




