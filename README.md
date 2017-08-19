# ja-emutest
## Jupiter Ace Emulator Tests

A set of tests for Jupiter Ace emulators. The only code required for the tests
is that in forth/tests.ja4. The code in the asm directory is the assembly source
for the machine code sections.

My emulator of choice happens to fail all of these tests so I am particularly
aware of these pitfalls. There could be many other tests worth adding to this
list.

Of those identified here, the only one that really bothers me is the realistic
access of back door video memory. I have tried quite a few and I have yet to
encounter an emulator that passes this test.

These are the tests that can be performed:

* bvf: This is the back versus front door memory access test. For the test to
pass, the back door test should take significantly longer than the front door
test. Depending on the emulator, the front door test will take about 24 seconds
and will spend about 30% of its time actually poking the screen memory. The
back door test should take significantly longer. The trouble is, I have no idea
how much longer...

* halt-test: The Z80 halt instruction is supposed to halt the CPU (well actually
run nop instructions) until the next interrupt. In some software, it may be used
for timing as an interrupt normally occurs every 50th of a second.

* udg-anim-test: Some software may achieve animation by altering the definitions
of characters already displayed on the screen. My emulator of choice happens to
have an optimisation whereby only the smallest possible rectangle of screen
memory containing character changes is updated to the display.

* sound-test: Pretty simple - is the speaker being emulated?

A word of warning: any timings displayed on screen are based on the video frame
counter which is updated by code, the execution of which is dependent on... the
emulator.
