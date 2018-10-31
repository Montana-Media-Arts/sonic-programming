// PERFORMANCE OPTIMIZATION

/*********************************************
Server.killAll

*********************************************/


// pull up help on Server Options
ServerOptions

(
// grab server options for localServer
// assign to variable 'o'
o = Server.default.options;

// return an array of available devices
ServerOptions.devices
o.inDevice = ServerOptions.devices[3];
o.inDevice = "Built-in Microph";
o.outDevice = ServerOptions.devices[3];


// specify the number of hardware channels
o.numInputBusChannels = 4;
o.numOutputBusChannels = 8;

// increase the memory size the SC utilizes
o.memSize = 2**21;


s.reboot;

// register a function to execute after the server is booted
s.doWhenBooted({
	// connect midi devices
	MIDIClient.init; MIDIIn.connectAll;
	// open the plot tree
	s.plotTree;
	// open the meter
	s.meter;
});

)

// to utilize multiple files, you must explicitly load them in
// ("/Users/mmusick/mm_GD/Creative_Improv/toLoad/*").loadPaths;
("./nameOfSubDir/*").loadRelative;