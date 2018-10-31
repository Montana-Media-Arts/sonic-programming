
// basic if/then syntax
// this is preffered
if( 0.5.coin, {"eric".postln}, {"micah".postln;})

// optional if/then syntax
if(0.5.coin) {"hahaha".postln;} {"der".postln;}

// addition syntax
(0.5.coin).if( {"yes".postln}, {"no".postln;})



// logical operators are methods
true.and(true)
true.and(false)
true.or(false)
false.or(false)

(
~der = true;
t = Task({
	while({~der}, {
		"ha".postln;
		1.wait;
	})
}).play;
)

