// arrays in SC

// initialize an array
a = ["ha", "hola", "hello"];

// see the array
a.postln;

// return the element at index 0
a[0]

// iterate over each item in the array
a.do( {arg elem, idx; elem.postln; idx.postln; "".postln;} )


(
a.do( {
	arg item, idx;

	a[idx] = item ++ item;

	item.postln;
	idx.postln;
	"".postln;
} )
)




// create an array from a number
100.do( {arg item, idx; idx.postln;} );