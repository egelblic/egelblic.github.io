# Regarding LEDs and resistors

LEDs are among the simplest output devices to use in a digital system, and as such they are among the most common,
both in hobbyist projects and complex commercial devices, possibly including the screen you're using right now.
A common mistake I see on electronics forums is [people not using resistors in series with their LEDs](https://www.reddit.com/r/beneater/search?q=resistor%20led&restrict_sr=1) - a lot of times, the circuit will seem to work
even if these resistors are omitted, so many beginning designers will omit them and then wonder why other
components in their circuit don't work.  It doesn't help that most tutorials don't cover the underlying physics in
much detail.  So today, that's what I'll be doing.

I should note that this is a 'long-answer' article - it's mostly about the underlying theory of our devices,
rather than anything practical.  Feel free to skip it.

## What is an LED

An LED, in its simplest form, is a diode, carefully formulated so that when it conducts, a high proportion of the 
electrical energy that it consumes is converted into light at a useful frequency (most usefully, visible light;
though infrared is also common).  Other than this property of emitting light, an LED is not fundamentally
different from any other diode.  In fact, all diodes produce light during operation; an LED is simply formulated
to ensure that that light is of a useful frequency, and structured to ensure that it isn't blocked by the diode
itself.

So, to understand LEDs from an electrical perspective, we need to understand diodes.

## So, what is a diode?

A diode is, in effect, a direction-dependent switch; when 'off', it simply doesn't conduct electricity, and
when 'on', it conducts but with a constant voltage drop.  We'll mostly be interested in the 'on' state for this
article.

When a diode is on, it applies a constant voltage against the current flowing, and will conduct whatever current
the surrounding circuit throws at it.  If the circuit will supply 1mA at that voltage, the diode will conduct 1mA.
If the circuit will supply 10kA, the diode will conduct 10kA.  (At least until it explodes in a few ms.)

This voltage depends on the diode - most non-LED diodes are about 0.7V, many red LEDs are about 2V, and blue
ones tend to be about 3V.

This means that, carelessly putting a diode to ground on your signal lines has two main problems.

## Problem 1: very high currents

As established, the diode doesn't care what voltage the rest of the circuit wants to supply - it'll only drop its internal (let's assume) 2V.  That means, if it's hooked up to a 5V logic signal, there's going to be 3V of voltage
difference that has to get made up ... somewhere.  In practice, that difference is mostly made up for by the
internal resistance of the logic circuit, and the wiring.

This has the problem, that since logic signals and wires both aren't intended to be resistors, they tend to have
small resistances, which means high currents.  More precisely, $V=IR$.  The voltage to be dropped by the wires
and logic circuits is the 5V ideal logic level - the 2V resistor drop = $5V-2V=3V$.  Some measurements with a 
breaboard of my own suggests resistances are typically in the range of $1\Omega$ for wiring components.  This
gives us a current of $\frac{3V}{1\Omega}=3A$.  Even allowing for massive error margins on our numbers, that is
an extreme current for logic systems - the LEDs themselves, for instance, typically have maximum safe currents of
$20mA$, orders of magnitude less.

While not every logic family will produce destructive currents (well-protected TTL logic such as the `74LSxx` 
series, for instance, can appear to work just fine under some conditions), there is another, somewhat more 
insidious problem:

## Problem 2: corrupted signal voltage.

Logic gates aren't designed to expect any possible voltage.  Instead, they have 3 main voltage ranges for their
inputs: the 0 and 1 levels of digital logic, and an invalid range in between.  The details depend on the logic
gates in question; as an example, An example TTL chip, the [`DM74LS00`](https://www.futurlec.com/74LS/74LS00.shtml), has $V_{IH}=2.0V$ and $V_{OH}
=2.7V$$.  What this means is, it'll output 2.7V for a logic `1`, but (to allow for noise and bus resistance) it'll
read anything over 2.0V as a `1`.

(I'll mostly focus on the case of a logic `1` here, because that's where the problem is most
likely to occur.)

You'll notice, this 2.0V threshold for a 1 to be read, is exactly the voltage drop for my LEDs, which means
that if yours have a slightly lower voltage drop, or your chips have a slightly higher $V_{IH}$, or there is
any voltage lost in the bus, you won't get reliable behavior.  

Best-case, you'll get a random value of either 1 or 0.  But, worst-case, you can draw extreme ammounts of power
and even damage the chip, especially with [CMOS](/logic_families/cmos.html), due to how they connect their
output to either $V_{dd}$ or $V_{ss}$, and if you accidentally provide a voltage they aren't expecting, you can
cause them to accidentally connect their outputs to both, creating a short.  (During normal operation, this
briefly happens during switching; it's responsible for most CMOS power consumption.)