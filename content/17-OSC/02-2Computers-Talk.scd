n = NetAddr("10.17.249.87", 57120);

n.sendMsg("/fromForrest", "hey there");


(
OSCdef(\fromForrest, {
	arg msg, time, addr, port;

	"".postln;
	msg.postln;
	addr.postln;
	port.postln;
	"".postln;
},
"/fromForrest"
)
)