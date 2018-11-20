127.0.0.1 // -> internal IP or Loopback IP address
// -> 0-99999 --> port. this is a specific location in an IP address


// specify an internal IP address as a Network Address
n = NetAddr("127.0.0.1", NetAddr.langPort); // local machine







(
OSCFunc.newMatching({
	|msg, time, addr, recvPort| msg.postln; \matching.postln;
},
'/chat',
n
); // path matching
)

(
OSCFunc.newMatching({
	|msg, time, addr, recvPort| msg.postln; \wildCard.postln;
},
'/*',
n
); // path matching
)




(
OSCFunc({
	|msg, time, addr, recvPort|
	msg.postln; \oneShot.postln;
},
'/chat',
n).oneShot; // once only
)



(
OSCdef(\test, {
	|msg, time, addr, recvPort|
	msg.postln; \unmatching.postln;
},
'/chat',
n); // def style
)

m = NetAddr("127.0.0.1", NetAddr.langPort); // loopback

// send an OSC Message to SC-Lang
m.sendMsg("/chat", "Hello App 1");
m.sendMsg("/chat", "Hello App 1"); // oneshot gone


m.sendMsg("/ch?t", "Hello App 1");
m.sendMsg("/*", "Hello App 1");
m.sendMsg("/chit", "Hello App 1"); // nothing


thisProcess


////////////////////////////////////////
// OSC Sniffing

OSCFunc.trace(true); // Turn posting on
OSCFunc.trace(false); // Turn posting on




//////////////////////////////////////////
(
OSCdef(\touchTest, {
	arg msg, time, addr, port;

	msg[1].postln;
	// time.postln;
	// addr.postln;
	// port.postln;


},


)

)





