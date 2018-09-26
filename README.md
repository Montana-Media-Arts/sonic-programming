# Sonic Programming (MART 391.01 - Special Topics Number)  |  Fall 2018


## Professor/Instructor

- [Dr. Michael Musick](http://michaelmusick.com)
- E-Mail: [michael.musick@umontana.edu](mailto:michael.musick@umontana.edu).
- Office: McGill Hall, 232.
- Office Hours:
    - Wednesdays: 12:00pm - 1:00pm
    - Thursdays: 11:30am - 1:30pm

## COURSE OVERVIEW

In _Sonic Programming_ students will learn how to utilize computer science based techniques to create, process, and distribute original sonic art and sound based work. This course will spend a majority of its time focused on the real-time creation of sonic art, as well as the application of concepts from interactive theory and interactive systems. This course combine students skills and technique in creative coding and sonic arts together.

In a time with an increasing number of job opportunities that require individuals to be capable of not only creating custom content, but of creating custom content that is live with interactive opportunities, it is important that artists become capable of utilizing technologies that allow for this. There are many tools available to artists to create these types of artworks. Fortunately, the principles underlying most of these technologies are transferable. Therefore, it is critical that artists learn at least one of these environments at a deep level. The knowledge and skills developed in one are then transferable to others.

This course will involve engaging classes that involve hands-on work. These will be complimented with in-class lectures on technique, critical listening to ground your work, and discussions of aesthetics as it relates to this type of sonic art. Assessment of students will be conducted through weekly sketches and two larger artworks.

## Objectives & Student Learning Outcomes

Through this course, students are expected to demonstrate an ability to:

- Discuss technical and aesthetic concerns within sonic arts that relate to creating custom art via specific programming environments.
- Employ the Unit Generator paradigm in relation to real-time signal based digital environments.
- Explain an understanding of digital audio signal flow as it relates to a non-DAW based sonic art creative process.
- Create organized code and have an ability to asses organization structures in other's code as it relates to artistic ideas.
- Synthesize creative sonic art works that consider both relevant aesthetics of the medium and the technical demands of working with code.
- Present one significant sonic art work to the public.

Students are expected to bring ideas to explore these techniques and skills. The goals of the projects are not simply about the successful application of the technical processes. Instead, the goal is to integrate these elements to make work that is meaningful.

## Links

- [Syllabus](https://github.com/Montana-Media-Arts/sonic-programming/tree/master/Syllabus.md)
- [Course GitHub Repo](https://github.com/Montana-Media-Arts/sonic-programming)


# Weekly Breakdown

## Week 1

**Monday**

_Welcome and course overview_

- Course Overview
- Syllabus
- Discussion of Technologies, Tools, and Supplies
    - [SuperCollider](https://supercollider.github.io)
    - Headphones
- Critique Days (Mandatory)
    - Project 1 - Critique in Class; Wednesday, October 24th
    - Project 2 - Critique in Class; Monday, December 3rd
- Extra Meetings (Mandatory)
    - Concert Showing (Project 2) - Monday, December 3rd. From 7pm-9pm
    - Final Meeting (Wednesday, December 12th; 1:10pm-3:10pm)
- Class Discussion


**Wednesday**

_Listening, Installation, and "Hello World"_

- Headphone Listening and Evaluation Discussion
    - [Spotify List of Suggested Tracks](https://open.spotify.com/user/mmusickm/playlist/6KBJcjjPE2QBem7NVuqVEa?si=T90TQ0MpQiqdeuFcc9HkAg)
- Install SuperCollider
- "Hello World" of SC
- Review Git & GitHub.com


## Week 2

**Monday:**

_No Class on Monday, Sept. 3rd for Labor Day_


**Wednesday**

_Installation Revisited, "Hello World", and lang vs. engine_

- Review install of SC
- Discussion of
    - SCSynth
    - SCLang
    - SCIDE
- Start Your Engines (SCSynth) - Booting the Server
- String-based "Hello World"
    - `.postln`
- An SC Approach to "Hello World" (aka. your first sine wave)
    - `{SinOsc.ar()}.play;`
- Executing code by lines (shift + return)
- Declaring Code Blocks (`( )`)
- Executing Code Blocks (cmd/cntrl + return)
- Comments
    - line comments (`//`)
    - block comments (`/* */`)


## Week 3

**Monday**

_Moving beyond static sine waves with modulation_

- Controlling Amplitude
    - `mul: `
    - BinaryOpUGen
        - `SinOsc.ar() * 0.2`
- Using the mouse to change parameters.
    - `MouseX.kr` & `MouseY.kr`
    - Let's make a [Theremin](https://en.wikipedia.org/wiki/Theremin)
- Introspection with polling
    - `.poll`
    - `.plot`
- Using `SinOsc.ar` to modulate UGen input arguments
    - Two ways of approaching Amplitude Modulation (AM Synthesis)
    - Frequency Modulation Synthesis via oscillators
- `mul` and `add`
- Error Messages
- Altering parameters in example code
- What is a "UGen"
    - [Unit Generators and Synths - SuperCollider help files](http://doc.sccode.org/Tutorials/UGens-and-Synths.html)
    - [Unit generator - Wikipedia](https://en.wikipedia.org/wiki/Unit_generator)
- Mathematical Order of Precedence
- Review Basic Data Types
    - Int
    - Float
    - Char
    - String
    - Symbol
    - Array

Sketch TODO: Use MouseX/Y or Additional SinOsc UGens to play. Make an "interesting" synth that explores the relationships between these UGens. Can you recreate what we have been doing in class on your own? Do you understand what is happening? We will share results at the start of next class.


**Wednesday**

_Audio Rate vs. Control Rate, Signal Flow, Variables, and Arguments_

- Audio Rate (`.ar`) vs. Control Rate (`.kr`)
- `.plot(duration:1)`
- Variables in SynthDefs
    - `var`
- _"Global"_ Variables
    - `a` - `z`
        - interpreter variables
    - `~var`
        - environment variables
- Variable scope in SC
- Arguments in SynthDefs
    - `arg`
    - using `.set(\argname, value)` to alter running synths
- Signal Flow
    - Representing Signal Flow in Code
    - Pyramid Structure or Nested Code
    - Using Variables (`var`)
    - variable reassignment




## Week 4

**Monday**

_Tour of Basic Deterministic Generator UGens, and Functions_

- [Tour of UGens](http://doc.sccode.org/Guides/Tour_of_UGens.html)
- Tour of Deterministic Generator UGens
    - [UGens → Generators → Deterministic  | SuperCollider Help](http://doc.sccode.org/Browse.html#UGens%3EGenerators%3EDeterministic)
- Functions
    - `{}`
    - [04. Functions and Other Functionality | SuperCollider Help](http://doc.sccode.org/Tutorials/Getting-Started/04-Functions-and-Other-Functionality.html)
    - [05. Functions and Sound | SuperCollider Help](http://doc.sccode.org/Tutorials/Getting-Started/05-Functions-and-Sound.html)
    - [Functions | SuperCollider Help](http://doc.sccode.org/Reference/Functions.html)
    - [Function | SuperCollider Help](http://doc.sccode.org/Classes/Function.html)
    - Evaluating Functions stored in variables
        - `.value()`
- Easy SynthDef via function notation (`{}.play;`)

**Wednesday**

_"In Living Stereo", Signal Arrays, and Output_

- Stereo Expansion
    - `SinOsc.ar([400, 440])`
    - `sig ! 2`
    - `.dup`
    - `[sig, sig]`
- Stereo UGens
    - `Pan2.ar()`
- Mixing down signal arrays
    - `Mix([])`
- The output UGen
    - `Out.ar()`
    - 0-based language (_including audio output Buses_)

Sketch TODO: Create a simple synth utilizing additive synthesis, subtractive synthesis, amplitude modulation, frequency modulation, or any other deterministic or stochastic UGens that you can play and change via mouse interaction or argument setting. We will share these at the next class.




## Week 5

**Monday**

_Envelopes and Randomness_

- 1-dimensional envelopes
    - `Line.kr()` & `XLine.kr()`
    - `Decay.ar()`
- Linear Envelope
    - `linen.kr()`
- ADR, ADSR, Perc, and Custom Envelopes
    - `Env.`
    - `EnvGen.kr()`
- Using envelopes beyond amplitude control
- Plotting envelopes w/ `.plot`
- `doneAction: x`
- Looping/Triggering Envelopes
- Random Number generation on the language and server
- Data manipulation
    - `.linlin`
    - `.linexp`
    - `.range`
    - `.exprange`
    - `.clip`

**Wednesday**

_Server-Side Sequencing_

- Clock UGens
    - `Impulse`
    - `Dust`
    - `LFNoise0/1/2`
- Trigger UGens
    - `Stepper`
    - `Select`
    - `Trig1`
    - `Latch`
- Envelope Gates


Sketch TODO: Create a short algorithmic work that utilizes envelopes and server-side sequencing/triggering.




## Week 6

**Monday**

_SynthDefs and Synths_

- `SynthDef`'s
    - Loading and storing them
- Playing `Synths`
- Initializing Arguments
- Altering Synths
- Load and Play a SynthDef
- The Synth Tree/Graph
- free-ing synths
- **Launch Project 1**
    - Create a significant sonic artwork using the skills you have thus far acquired with SuperCollider and in Sonic Programming.
    - This artwork may be presented as a live work that you "perform" or a fixed-work that is played back from a sound file or SC itself.
    - If you create a fixed-work, please feel free to utilize a DAW to edit, mix, and master your content.
        - This does not have to be a worked fully realized within SuperCollider.
        - However, all sounds should originate from SC, but may be further edited together and mixed in an external environment.
    - These are to be significant pieces that show engagement with the creative process as it relates to working with sonic programming.
        - To that end, you should document your creative process, including;
            - ideas
            - tests
            - personal responses
            - iteration
            - creative goals
            - desired artistic outcomes
        - Documentation should be completed through a combination of recording, git commits, and personal reflection.

**Wednesday**

_Language-Side Scheduling and Sequencing_

- Scheduling with `{}.fork` & `t.wait`
    - `.do{}` loops
    - `.stop`
- `TempoClock()`'s
- `Task({})`
- `Routine({})`

Sketch TODO: Write a short work that encapsulates your synth's as SynthDefs. Then utilize language-side scheduling to launch and alter synths algorithmically.




## Week 7

**Monday**

_Sound Input and Buses_

- Processing Audio from the Real World
    - `SoundIn.ar()`
    - Warnings about feedback
- Server Options
    - Specifying number of input or output bus channels
- An in-depth discussion of Buses
- Audio Buses
    - `a = Bus.audio(s,1)`
        - `a.index`
    - `Out.ar()`
    - `In.ar()`
    - `InFeedback.ar()`
    - `LocalIn.ar()`
    - `LocalOut.ar()`
    - Overwriting Buses
    - Block Processing Explained
- Control Buses
    - `c = Bus.audio(s,1)`
    - `c.index`
    - `c.set(9)`
- Using Buses as Synth Arguments Maps
    - `'Synth__00'.map(\freq, c.index)`



**Wednesday**

_Nodes, Groups, Effects, and Synth Order_
- Nodes and the Synth Node Tree
    - Order of operation
    - specifying node order
    - `.tail`
    - `.head`
    - `.before`
    - `.after`
- Using Synths as Effects Processors
- Tour of Delay UGens
    - `CombN/L/C`
    - `Delay`
    - `DelayN`
    - [Delay UGens | SuperCollider Help](http://doc.sccode.org/Browse.html#UGens%3EDelays)
- Tour of Filter UGens
    - `LPF`
    - `RLPF`
    - `HPF`
    - `RHPF`
    - `BPF`
    - `BRF`
    - `Resonz`
    - [Filter UGens | SuperCollider Help](http://doc.sccode.org/Browse.html#UGens%3EFilters)




## Week 8

**Monday**

_Sound Files and Buffers_

- What is a Buffer?
- The various ways the Buffers are used in audio processing environments
- Allocating Buffers
    - `b=Buffer.alloc(s, 10*)`
- Freeing Buffers
    - `b.free`
    - Discussion of the importance of freeing buffers
- Loading Audio Files into Buffers
- Playing Buffers
    - Rate
    - Direction
    - Amplitude
- Playing Back LOOOOOOONG Audio Files
- Recording SC

Sketch TODO: Create a short sound work that explores the use of sound input or soundfiles along with inter-synth bussing.

**Wednesday**

_Granular Synthesis_

- Granular Synthesis
    - Discussion and Description
    - Theoretical Underpinnings
- Playing with Grains
- Grain Rate
- Window Functions
- Precise Timing in SC




## Week 9 - Crit Day #1

**Monday**

_Individual Review Day in Preparation for Crit #1_

- This is a chance for you to work on your works and get help from the instructor or your fellow classmates.


**Wednesday**

_Crit Day #1_

- Present Project 1 artworks in class.
- These will be critiqued in class with the whole class participating.
- Regardless of whether you work is a live or fixed piece, you should submit a fixed version to the instructor. This should be accompanied with a program/gallery note as well as longer artistic description.




## Week 10

**Monday**

_Patterns & PBind_

- This week is a deep dive into the world of algorithmic composition, as allowed through SuperColliders Pattern capabilities.
- Basic Pattern techniques with PBind
- Effecting and controlling everything with patterns
- Patterns Math
- Patterns in Patterns, effecting patterns.
- Creative Approaches to Algorithmic Driven Art
- **Launch Project 2**
    - You are to create a significant sonic artwork that will be presented to the public the night of December 3rd.
    - This artwork can be a performance-based work or gallery-based work.
    - This is a significant work.
    - This work is to be made exclusively within SuperCollider
        - NOTE: You may bring other media into SC, but you may not create works that are finished outside of SC as in Project 1.
    - This is to be significant pieces that show engagement with the creative process as it relates to working with sonic programming.
        - To that end, you should document your creative process, including;
            - ideas
            - tests
            - personal responses
            - iteration
            - creative goals
            - desired artistic outcomes
        - Documentation should be completed through a combination of recording, git commits, and personal reflection.

Sketch TODO: Create a short artwork utilizing patterns and pattern manipulation


**Wednesday**

_Performance Issues with SC & Inter-App Audio Routing_

- Technical considerations for SC when performing or presenting live.
- How to setup SC as a performance environment.
- How to setup SC as an installation engine.
- Inter-Application Audio Routing


## Week 11

**Monday**

_Fast Fourier Transform (FFT) Processing_

- Overview of the mathematical concepts behind Fourier transforms.
- Signal Analysis in the Frequency-Domain
- Converting signals between time-domain and frequency-domain
- Frequency-Domain based processing


**Wednesday**

_Analysis and Basic Machine Listening_

- How can we use audio signals as control data?
- Amplitude following
- Peak following
- Fundamental Frequency Estimation
- Frequency-Domain Analysis Techniques




## Week 12

**Monday**

_Open Sound Control_

- What is the Open Sound Control (OSC) protocol
- OSC and your computer
- OSC between SCSynth and SCLang
- Inter-app communication with OSC
- Computer to Computer communication with OSC
- Using your phone to control SC
- TouchOSC
- Lemur


**Wednesday**

_Physical Computing_

- Review of Arduinos, Teensy, etc.
- Communicating between Arduino and SC with Serial connection
- OSC Libraries for Arduino and Teensy
- Using an Arduino as a controller
- Controlling Arduino from SC




## Week 13

**Monday**

_Work and Feedback on Project 2_

- You are encouraged to present or perform your work for the professor.
    - There will be a second room setup to accommodate this.
    - This is an opportunity to practice your performance or present your gallery piece and receive critical feedback before the official crit day.
    - The professor will provide you with information about what was and was not successful in their view.
    - If this is a performance, the professor will work with you on the technical details of performing and the reception of the performance.
    - If this is a gallery work, the professor will work with you on the technical details of presenting a self-running work and the reception of the work.


**Wednesday**

_Work and Feedback on Project 2 Continued_

- We will continue informal presentations and feedback with the professor.


## Week 14 - Public Presentation

**Monday**

_Public Performance and Presentation_

- During class we will setup the presentation areas and performance space for the evening show.
- For those of you presenting gallery-works, you will be responsible for setting up, cleaning, and preparing the gallery spaces.
    - After setup is complete of the spaces themselves, you may install your works and test them.
- For those of you presenting performance/concert works, you will be responsible for setting up, cleaning, and preparing the performance space.
    - After setup is complete, we will briefly sound-check each piece.
- Call for the evening presentation will be 5:00pm. Please plan to be to the space by that time.
    - Gallery spaces will open at 5:30pm.
    - The show will start around 7pm.
    - Gallery spaces will remain open for 30 minutes after the shows conclusion.


**Wednesday**

_Formal Critique and Wrap-up Discussion_

- We will have a formal critique of presentations from Monday. Please be prepared with a fixed video/audio-representation of your work.
- We will also discuss the semester, future opportunities, and directions that this work can take you.
