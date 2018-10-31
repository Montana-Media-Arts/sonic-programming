// Task


(
t = Task({
    50.do({ arg i;
        i.squared.postln;
        0.5.wait;
    });
});
)

t.start;
t.pause;
t.resume;
t.reset;
t.stop;