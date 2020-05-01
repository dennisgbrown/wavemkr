# wavemkr
Amiga BASIC program to edit sound waveforms by hand. From the About box:

This program allows you to draw sound waves for use in Amiga BASIC. It creates output files containing 256 elements. Each element is a number between -127 and 128. To use them in your program, add the following:

    DEFINT a-z  'This line goes in the beginning.
    DIM wav%(255)
    OPEN wavefilename FOR INPUT AS #1
    FOR q=0 to 255"
      INPUT #1,wav%(q)"
    NEXT q"
    CLOSE #1"
    WAVE 0,wav%:WAVE 1,wav%:WAVE 2,wav%:WAVE 3,wav%"
    CLEAR wav%  'This line reserves memory"

Everything you now play with the SOUND command will have this wave form.

This program was written by Dennis Brown on February 25, 1990. It is public domain material. Use it and have fun!

![Screenshot](https://github.com/dennisgbrown/wavemkr/blob/master/wavemkr.jpg?raw=true "Wave Maker")

