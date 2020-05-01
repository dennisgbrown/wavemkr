'Start here  -  DUH!
  CLS
  CLEAR
  DEFINT a-z
  SCREEN 1,640,400,1,4
  WINDOW 2,"Waveform Editor",,,1
  dv$="df0:"
  MENU ON
  MENU 1,0,1,"Info      "
  MENU 1,1,1," About WaveMaker    "
  MENU 2,0,1,"Files     "
  MENU 2,1,1," Load Waveform      "
  MENU 2,2,1," Save Waveform      "
  MENU 2,3,1," Test Waveform      "
  MENU 2,4,1," Set Default Device "
  MENU 2,5,1,"     Quit           "
  MENU 3,0,1,"Defaults  "
  MENU 3,1,1," Straight line      "
  MENU 3,2,0," Sine               "
  MENU 3,3,0," Sawtooth           "
  MENU 3,4,0," Triangle           "
  MENU 4,0,0,"          "
  LINE (192,72)-(449,72)
  LINE (449,72)-(449,329)
  LINE (449,329)-(192,329)
  LINE (192,329)-(192,72)
  LINE (193,201)-(448,201)
  LINE (187,201)-(192,201)
  LINE (449,201)-(454,201)
  DIM wav(255)
  FOR jkl=1 TO 255
  wav(jkl)=0
  NEXT jkl
'End of setup

checkmouse:
  ON MENU GOSUB menustuff
  IF MOUSE(0)<>-1 THEN checkmouse
  IF MOUSE(1)<193 THEN checkmouse
  IF MOUSE(1)>448 THEN checkmouse
  IF MOUSE(2)<73 THEN checkmouse
  IF MOUSE(2)>328 THEN checkmouse
  LINE (MOUSE(1),73)-(MOUSE(1),328),0
  PSET(MOUSE(1),MOUSE(2))
  j=MOUSE(2)-201
  y=-j
  wav(MOUSE(1)-193)=y
GOTO checkmouse

savewave:
  WINDOW 3,"Save Waveform",(50,50)-(400,60),4,1
  LINE INPUT "Wave name: ";nhj$
  PRINT
  PRINT "Saving...";
  nhj$=dv$+nhj$
  OPEN nhj$ FOR OUTPUT AS #1
  FOR klop=0 TO 255
  WRITE #1,wav(klop)
  NEXT klop
  CLOSE #1
  WINDOW CLOSE 3
RETURN

loadwave:
  WINDOW 3,"Load Waveform",(50,50)-(400,60),4,1
  LINE INPUT "Wave name: ";nhj$
  PRINT
  PRINT "Loading...";
  nhj$=dv$+nhj$
  OPEN nhj$ FOR INPUT AS #1
  FOR klop=0 TO 255
  INPUT #1,wav(klop)
  NEXT klop
  CLOSE#1
  WINDOW CLOSE 3
  GOSUB drawwave
RETURN

drawwave:
  LINE (193,73)-(448,328),0,bf
  FOR klop=0 TO 255
  j=wav(klop)-201
  y=-j
  PSET (klop+193,y)
  NEXT klop
RETURN

setdv:
  WINDOW 3,"Set Device",(50,50)-(400,70),4,1
  PRINT "Include : in name."
  LINE INPUT "Device name: ";dv$
  PRINT  
  WINDOW CLOSE 3
RETURN

menustuff:
  m1=MENU(0)
  ON m1 GOSUB abstuff,filstuff,defstuff,blnk
RETURN

dsine:
RETURN

dsawtooth:
RETURN

dtri:
RETURN

Dline:
  FOR kp=0 TO 255
  wav(kp)=0
  NEXT kp
  GOSUB drawwave
RETURN

defstuff:
  m2=MENU(1)
  ON m2 GOSUB Dline,dsine,dsawtooth,dtri
RETURN

filstuff:
  m2=MENU(1)
  ON m2 GOSUB loadwave,savewave,testwaveform,setdv,theend
RETURN

testwaveform:
  WAVE 0,wav
  WAVE 1,wav
  WAVE 2,wav
  WAVE 3,wav
  SOUND 523,35,,0
  SOUND 659,35,,0
  SOUND 784,35,,1
  SOUND 1047,35,,0
RETURN

theend:
  SCREEN CLOSE 1
  MENU RESET
  CLEAR 
END

abstuff:
  WINDOW 3,"About WaveMaker",(40,40)-(600,360),4,1
PRINT:PRINT:PRINT "This program allows you to draw sound waves for use in"
            PRINT "Amiga BASIC. It creates output files containing 256"
            PRINT "elements. Each element is a number between -127 and"
            PRINT "128. To use them in your program, add the following:"
      PRINT:PRINT "    DEFINT a-z  'This line goes in the beginning."
            PRINT "    DIM wav%(255)"
            PRINT "    OPEN wavefilename FOR INPUT AS #1"
            PRINT "    FOR q=0 to 255"
            PRINT "      INPUT #1,wav%(q)"
            PRINT "    NEXT q"
            PRINT "    CLOSE #1"
            PRINT "    WAVE 0,wav%:WAVE 1,wav%:WAVE 2,wav%:WAVE 3,wav%"
            PRINT "    CLEAR wav%  'This line reserves memory"
      PRINT:PRINT "Everything you now play with the SOUND command will"
            PRINT "have this wave form."
      PRINT:PRINT "This program was written by Dennis Brown on "
            PRINT "February 25, 1990. It is public domain material."
            PRINT "Use it and have fun!"
      PRINT:PRINT "Press Return:";:LINE INPUT useless$
  WINDOW CLOSE 3
RETURN    

blnk:
RETURN


 










