# Sonic Programming (MART 420.01)  |  Fall 2021


## Professor/Instructor

- [Dr. Michael Musick](http://michaelmusick.com)
- E-Mail: [michael.musick@umontana.edu](mailto:michael.musick@umontana.edu).
- Office: McGill Hall, 232.
- Office Hours:
    - Wednesdays: 12:00pm - 1:00pm
    - Thursdays: 11:30am - 1:30pm

## Links

- [Syllabus](https://github.com/Montana-Media-Arts/sonic-programming/tree/master/Syllabus.md)
- [Course GitHub Repo](https://github.com/Montana-Media-Arts/sonic-programming)


## COURSE OVERVIEW

In _Sonic Programming_ students will learn how to utilize computer science based techniques to create, process, and distribute original sonic art and sound based work. This course will spend a majority of its time focused on the real-time creation of sonic art, as well as the application of concepts from interactive theory and interactive systems. This course combine students skills and technique in creative coding and sonic arts together.

In a time with an increasing number of job opportunities that require individuals to be capable of not only creating custom content, but of creating custom content that is live with interactive opportunities, it is important that artists become capable of utilizing technologies that allow for this. There are many tools available to artists to create these types of artworks. Fortunately, the principles underlying most of these technologies are transferable. Therefore, it is critical that artists learn at least one of these environments at a deep level. The knowledge and skills developed in one are then transferable to others.

This course will involve engaging classes that involve hands-on work. These will be complimented with in-class lectures on technique, critical listening to ground your work, and discussions of aesthetics as it relates to this type of sonic art. Assessment of students will be conducted through weekly sketches and two larger artworks.



---


# Class Breakdown

- [Week 1](#week-1)
- [Week 2](#week-2)
- [Week 3](#week-3)
- [Week 4](#week-4)
- [Week 5](#week-5)
- [Week 6](#week-6)
- [Week 7](#week-7)
- [Week 8](#week-8)
- [Week 9 - Crit Day #1](#week-9---crit-day-1)
- [Week 10](#week-10)
- [Week 11](#week-11)
- [Week 12](#week-12)
- [Week 13](#week-13)
- [Week 14 - Public Presentation](#week-14---public-presentation)




# Weekly Breakdown

## Week 1

_Baby_

## Week 2

_Baby_

## Week 3

**Part 1**

_Welcome and course overview_

- Course Overview
- Syllabus
- Discussion of Technologies, Tools, and Supplies
    - [SuperCollider](https://supercollider.github.io)
    - Headphones
- Critique Days (Mandatory)
    - Project 1 - Critique in Class; Friday, October 29th
    - Project 2 - Critique in Class; Monday, December 3rd
- Extra Meetings (Mandatory)
    - Concert Showing (Project 2) - Friday, December 3rd. From 7pm-9pm
    - KGBA Presentation (Virtual Attendance Requested) - Wednesday, December 8th. From 8pm-10pm
     - Finals Meeting (Wednesday, December 15th; 8:00AM-10:00AM)
- Class Discussion


**Part 2**

- Install SuperCollider
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
- Using the mouse to change parameters.
    - `MouseX.kr` & `MouseY.kr`
    - Let's make a [Theremin](https://en.wikipedia.org/wiki/Theremin)
- video review and help
    -  [SuperCollider Tutorial: 1. Navigating the Environment - YouTube](https://www.youtube.com/watch?v=ntL8QDOhhL8)
    -  [SuperCollider Tutorial: 2. Making Sound - YouTube](https://www.youtube.com/watch?v=oTBcGPXH6K0)
-  GIT Video (Previewing GIT)
    - [Creative Coding 1, MART 120 | GitHub Part 1](https://montana-media-arts.github.io/creative-coding-1/modules/week-1/github-part1/)
	- [Creative Coding 1, MART 120 | Git Version Control](https://montana-media-arts.github.io/creative-coding-1/modules/week-2/git-version-control/)
	- [Creative Coding 1, MART 120 | Git GUI Applications (GitHub Desktop)](https://montana-media-arts.github.io/creative-coding-1/modules/week-2/git-gui-github/)
	- [Creative Coding 1, MART 120 | Working with Git](https://montana-media-arts.github.io/creative-coding-1/modules/week-2/working-with-git/)
	- [Creative Coding 1, MART 120 | GitHub.com](https://montana-media-arts.github.io/creative-coding-1/modules/week-2/github/)
	- [Creative Coding 1, MART 120 | Markup & Markdown](https://montana-media-arts.github.io/creative-coding-1/modules/week-2/markup/)


## Week 4

**Part 1**

_Installation Revisited, "Hello World", and lang vs. engine_

- Review install of SC
- Review git & GitHub.com


**Part 2**

_Moving beyond static sine waves with modulation_

- What is a "UGen"
    - [Unit Generators and Synths - SuperCollider help files](http://doc.sccode.org/Tutorials/UGens-and-Synths.html)
    - [Unit generator - Wikipedia](https://en.wikipedia.org/wiki/Unit_generator)
- Error Messages
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
- Controlling Amplitude
    - `mul: `
    - BinaryOpUGen
        - `SinOsc.ar() * 0.2`
- Introspection with polling
    - `.poll`
    - `.plot`
- Using `SinOsc.ar` to modulate UGen input arguments
    - Two ways of approaching Amplitude Modulation (AM Synthesis)
    - Frequency Modulation Synthesis via oscillators
- `mul` and `add`
- Altering parameters in example code
- Mathematical Order of Precedence
- Review Basic Data Types
    - Int
    - Float
    - Char
    - String
    - Symbol
    - Array

_Listening, Inspiration, and Software Installation_

- Headphone Listening and Evaluation Discussion
    - [Spotify List of Suggested Tracks](https://open.spotify.com/user/mmusickm/playlist/6KBJcjjPE2QBem7NVuqVEa?si=T90TQ0MpQiqdeuFcc9HkAg)
- Discussion and Listening to artists that will inspire our semester.


Sketch TODO: Use MouseX/Y or Additional SinOsc UGens to play. Make an "interesting" synth that explores the relationships between these UGens. Can you recreate what we have been doing in class on your own? Do you understand what is happening? We will share results at the start of next class.

## Week 4

**Part 1**

_Audio Rate vs. Control Rate, Signal Flow, Variables, and Arguments_


- Signal Flow
    - Representing Signal Flow in Code
    - Pyramid Structure or Nested Code
    - Using Variables (`var`)
    - variable reassignment

**Part 2**

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

Sketch TODO: Create a simple synth utilizing additive synthesis, subtractive synthesis, amplitude modulation, frequency modulation, or any other deterministic or stochastic UGens that you can play and change via mouse interaction or argument setting. We will share these at the next class.


## Week 5

**Part 1**

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


**Part 2**

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

## Week 6

**Part 1**

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



## Week 7

**Part 1**

_SynthDefs and Synths_

- `SynthDef`'s
    - Loading and storing them
- Playing `Synths`
- Initializing Arguments
- Altering Synths
- Load and Play a SynthDef
- The Synth Tree/Graph
- free-ing synths


**Part 2**

_Language-Side Scheduling and Sequencing_

- Scheduling with `{}.fork` & `t.wait`
    - `.do{}` loops
    - `.stop`
- `TempoClock()`'s
- `Task({})`
- `Routine({})`
-
**Launch Project 1**
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

Sketch TODO: Write a short work that encapsulates your synth's as SynthDefs. Then utilize language-side scheduling to launch and alter synths algorithmically.


## Week 8

**Part 1**

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



**Part 2**

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

## Week 9 - Crit Day #1

**_Crit Day #1_**

- Present Project 1 artworks in class.
- These will be critiqued in class with the whole class participating.
- Regardless of whether you work is a live or fixed piece, you should submit a fixed version to the instructor. This should be accompanied with a program/gallery note as well as longer artistic description.



## Week 10

**Part 1**

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


**Part 2**

_Granular Synthesis_

- Granular Synthesis
    - Discussion and Description
    - Theoretical Underpinnings
- Playing with Grains
- Grain Rate
- Window Functions
- Precise Timing in SC

Sketch TODO: Create a short sound work that explores the use of sound input or soundfiles along with inter-synth bussing.





## Week 11

**Part 1**

_Patterns & PBind_

- Please Read:
    - ["Part II - Patterns" from Bruno Ruviaro's _A Gentle Introduction to SuperCollider_](https://ccrma.stanford.edu/~ruviaro/texts/A_Gentle_Introduction_To_SuperCollider.pdf)
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



**Part 2**

_Performance Issues with SC & Inter-App Audio Routing_

- Technical considerations for SC when performing or presenting live.
- How to setup SC as a performance environment.
- How to setup SC as an installation engine.
- Inter-Application Audio Routing

Sketch TODO: Create a short artwork utilizing patterns and pattern manipulation


## Week 12

**Part 1**

_Fast Fourier Transform (FFT) Processing_

- Overview of the mathematical concepts behind Fourier transforms.
- Signal Analysis in the Frequency-Domain
- Converting signals between time-domain and frequency-domain
- Frequency-Domain based processing


**Part 2**

_Analysis and Basic Machine Listening_

- How can we use audio signals as control data?
- Amplitude following
- Peak following
- Fundamental Frequency Estimation
- Frequency-Domain Analysis Techniques



{% comment %}



## Week 13

**Part 1**

_Open Sound Control_

- What is the Open Sound Control (OSC) protocol
- OSC and your computer
- OSC between SCSynth and SCLang
- Inter-app communication with OSC
- Computer to Computer communication with OSC
- Using your phone to control SC
- TouchOSC
- Lemur


**Part 2**

_Physical Computing_

- Review of Arduinos, Teensy, etc.
- Communicating between Arduino and SC with Serial connection
- OSC Libraries for Arduino and Teensy
- Using an Arduino as a controller
- Controlling Arduino from SC


{% endcomment %}


## Week 13

**_No Class: Due to Thanksgiving Break_**

_Work on Project 2_


## Week 14 - Public Presentation

**Part 1**

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


**Part 2**

_Performance in the Evening_


## Week 15

_Formal Critique and Wrap-up Discussion_

- We will have a formal critique of presentations from last week. Please be prepared with a fixed video/audio-representation of your work.
- We will also discuss the semester, future opportunities, and directions that this work can take you.
