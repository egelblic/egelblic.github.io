# The Touchback Screen

(video goes here)

## What it does

Regular touchscreens are great, but they have one massive problem.  You can't use a touchscreen by feel.  That's where the touchback screen comes in.  By using a force-sensing system and a series of vibration motors, the touchback screen lets you feel where on the screen your finger is.

## How it works

<svg height=300 width=200>
	<rect x = 40 y = 0 width=4 height=300 style="fill:rgb(0,255,0)" />
	<rect x = 44 y = 0 width=4 height=300 style="fill:rgb(0,0,255)" />
	<rect x=30 y=0 width=10 height=10 style="fill:rgb(255,0,0)"/>
	<rect x=30 y=96.6 width=10 height=10 style="fill:rgb(255,0,0)"/>
	<rect x=30 y=193.3 width=10 height=10 style="fill:rgb(255,0,0)"/>
	<rect x=30 y=290 width=10 height=10 style="fill:rgb(255,0,0)"/>
	<rect x=20 y=0 width=10 height=300 style="fill:rgb(127,127,127)"/>
	<rect x=10 y=36.25 width=2 height=20 style="fill:rgb(160,160,160)"/>
	<rect x=10 y=37.25 width=9 height=8 style="fill:rgb(160,160,160)"/>
	<rect x=0 y=46.25 width=20 height=20 style="fill:rgb(191,191,191)"/>
	<rect x=10 y=108.75 width=2 height=20 style="fill:rgb(160,160,160)"/>
	<rect x=10 y=109.75 width=9 height=8 style="fill:rgb(160,160,160)"/>
	<rect x=0 y=118.75 width=20 height=20 style="fill:rgb(191,191,191)"/>
	<rect x=10 y=181.25 width=2 height=20 style="fill:rgb(160,160,160)"/>
	<rect x=10 y=182.25 width=9 height=8 style="fill:rgb(160,160,160)"/>
	<rect x=0 y=191.25 width=20 height=20 style="fill:rgb(191,191,191)"/>
	<rect x=10 y=253.75 width=2 height=20 style="fill:rgb(160,160,160)"/>
	<rect x=10 y=254.75 width=9 height=8 style="fill:rgb(160,160,160)"/>
	<rect x=0 y=263.75 width=20 height=20 style="fill:rgb(191,191,191)"/>
	<rect x=70 y=0 width=4 height=15 style="fill:rgb(0,255,0)"/>
	<rect x=74 y=0 width=4 height=15 style="fill:rgb(0,0,255)"/>
	<text x=90 y=10 fill="white">&lt;- screen</text>
	<rect x=70 y=145 width=10 height=15 style="fill:rgb(255,0,0)"/>
	<text x=90 y=155 fill="white">&lt;- touch sensor</text>
	<rect x=80 y=270 width=2 height=20 style="fill:rgb(160,160,160)"/>
	<rect x=80 y=271 width=9 height=8 style="fill:rgb(160,160,160)"/>
	<rect x=70 y=280 width=20 height=20 style="fill:rgb(191,191,191)"/>
	<text x=90 y=290 fill="white">&lt;- motor</text>
</svg>

<!--TODO enlarge, add key-->

The touchback screen uses a regular capacitive touch screen, mounted on a force sensor.  The capacitive screen tracks where the user's finger is, and a series of vibration motors give feedback whenever the user's finger moves between parts of the interfact.  When the user presses firmly on the screen, the force sensor registers that as a press, which is signalled to the user via the same vibration motors.

## How to get one