// Class 1 - 9.17.2021
//
// Welcome to the class


/////////////////////////////////////////////////////////
// Hello World
"Hello World!".postln;
// In our basic hello world, we create a string ("hello world"). Then attach a mathod of `.postln;`, which tells the interpreter to post the string, with a new line charachter to the "Post Window".
// To execute this command, place your mouse on the line, and press Shift+Enter, or Cmd/Cntrl+Enter

// Multiple Commands
(
"Hello ".post;
"World!".postln;
)
// To execute multiple commands at once, encapsilate them in a block, using paranthesis "()"
// With your mouse anywhere within the block, press Cmd/Cntrl+Enter





//////////////////////////////////////////////////////////////////
// DATA TYPES

// Binary or Boolean
0/1 -> Binary
True/False => Boolean
True  // Posts true
False  // Posts false
0 == False

// Integer
0, 1, 2, 3, 4...

// Float
3.145678
-1000.34

// Character
'a', 'D', '2', '!'
's'

// String
// is a collection of characters, typically signfied by double quotes
"This is a string"

// Array
// is a collection of (typically) a single data type
[3, 6, 32, 4]




///////////////////////////////////////////
// Math
2 + 2

// follows standard order of operations
()
^ /*or*/ **
*
/
+
-

2 * (2 + 1)


//////////////////////////////////////////////////////
// Comments
// A comment is information for the artists/programmer/developer
// comments are NOT sent to the interpreter
// comments are for you and me

// This is a single line comment
"I can include a single line comment, at the end of a line"; // end of line comment

// a comment before a command, does not work 2+2;

/* this is a multi-line comment, or embedded comment */
/*
1
2
3 line
*/

"Hey there everyone".postln; /*embedded comment*/ "how are you?".postln;