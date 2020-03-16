# What is digital?

Digital systems are systems that transmit, store, and process data using one of two states, commonly called `1`
and `0`.  We usually think of digital systems as electronic, but digital design has nothing to do
with electronics, and in fact can be done using all sorts of technologies.

As such, you don't need to know that much about electronics to do digital work.  Here, I'll provide a quick
rundown of what you need to know to work with digital electronics.  (Note that most of these have analogs in
other technologies - for instance, mechanical systems may use position or movement speed instead of voltage,
and complex linkages instead of transistor circuits.)

## Voltage

Voltage is a common way to consider available energy in electronic systems.  Batteries produce a constant voltage
using chemistry,
the wall supplies an alternating cycle of voltage generated mostly by mechanically driven magnets,
natural systems such as clouds can produce immense voltages (for reasons we still don't fully understand)
with spectacular and dangerous results.

Voltage is, simply, what happens when, due to an accumulation of charge or an external electric field, electrons
'want' to move from one place to another.  For instance, in a battery, chemical reactions rip electrons away from
the positive terminal and towards the negative (remember, electrons are negatively charged).  This causes a
negative charge to build up on the negative terminal, and a positive one to build up at the positive terminal.

Since the positive charge attracts the electrons back to the positive terminal, and the negative electrons at the
negative terminal repel each other, the electrons 'want' to move back to the positive terminal, and if we provide
them a path, they will move.  That movement is called current, shown with the symbol $I$.  (It should be noted
that, since electrons are negative, that movement is actually considered opposite to the direction of what
we call conventional current.)

Moreover, we don't have to provide the electrons a super-easy path - we can make them do work on the way.  That is
to say, that the electrons have energy.  The amount of energy is expressed, with a property we call the voltage: 
$E=QV$, where $V$ is the voltage, $Q$ is the amount of charge, and $E$ is the amount of energy.  (Note: this 
formula only works if the amount of charge doesn't affect the 
voltage, which is true of systems such as batteries, but not of capacitors.)  

## Wires

Wires (and all conductors), at least in a digital system, work very simply - they move electrons about, so that
the entire wire is at the same voltage.  This can be used to connect an output to an input, simply by running a
piece of metal (wire, breadboard channel, PCB trace, or any combination thereof) from the output to the input.
(In fact, you can connect any number of inputs together like this.  You can also connect multiple outputs,
but you need to be careful that only one output is active at a time.)

## Semiconductors.

Ok, now here's where things get both beautiful and complicated.  You see, there are materials called
semiconductors, so named because their conductivity can change under various conditions, and those conditions
can be selected by a designer to produce useful behavior.  There are many types of semiconductor device
that can do this, with the most common these days being [CMOS integrated circuits](logic_families/cmos.html),
though [TTL](logic_families/ttl.md) is also commonplace, especially with the simpler logic gate ICs, as well as
older systems.

CMOS, TTL, and many other technologies all rely on the same general property - transistors have two pins, one
of which controls the behavior of the other two - depending on the type of transistor, applying a voltage
to the control pin will either cause current to flow between the other two pins until they reach the same voltage,
or cause it to cease conducting and allow them to reach radically different voltages.

To output a `1`, a system simply connects its output to its power voltage, and to output a `0`, it connects the
output to ground.  (It is also possible for a system to not connect either, and leave the pin in a state we
call high-impedance, so that if it shares an output with other devices, it can let those other devices output
without a single wire being connected to both power and ground.)  The exact design of this circuit, and even the
type of transistor used, will depend on the specific logic family.