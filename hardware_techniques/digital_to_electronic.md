# Translating a digital design to an electronic circuit

You probably do much of your digital design without worrying too much about the properties
of electronics, but sooner or later, it comes time to build the thing, and you need to know
how to choose your electronics.  Fortunately, there's a simple procedure.

Let's say you have a digital design, such as ...

This full adder!

Conveniently, converting from a high-level digital design, to a circuit schematic, can be broken down into
a series of steps.

<img src="/images/full_adder.png" />

## Step 1: see if the circuit can be converted to use simpler components

This isn't entirely necessary, but it can save you components and space, and it means you don't
need to stock up on quite as many types of chips.  I'll go into the details
[here](digital_techinques/logic_simplification), but for now...

With 74-series (what I recommend for simple logic like this), a single chip will usually have a few
of the same type of gate.  For instance, that 3-input XOR gates come on chips of 3, and all 2-input
gates come in chips of 4.  So the above design will use at minimum 3 chips, 1 for XOR, 1 for AND,
and 1 for OR.

But, we can save a chip by converting the bottom circuit to 3 NAND gates:

<img src="/images/full_adder_nand.png" />

## Step 2: select your components

I'm gonna go with a very standard component selection: a 74LS00 4x 2-input NAND gate, and a 74LS86 4x 2-input XOR
gate.  (Wikipedia has [a list of 74-series part numbers](https://en.wikipedia.org/wiki/List_of_7400-series_integrated_circuits))

Here's the datasheets for these chips:

- [SN74LS00N](https://www.ti.com/lit/ds/symlink/sn74ls00.pdf)
- [DM74LS86N](https://www.jameco.com/Jameco/Products/ProdDS/48098.pdf)

## Step 3: design the circuit schematic

This is a simple matter of copying your digital logic into an electronics schematic, except that instead of free-
floating gates, you're using gates that are a part of the chip.  Which pins correspond to the input and output of
each gate, should be on the datasheet.

## Step 4: add power and ground

How to design the schematic depends on the designer.  I design mine, to primarily show which pins get connected
together in a physical layout, but there are tons of styles.  As long as your schematic doesn't lie, you're fine.

## Step 5: tie unused inputs low

This isn't essential for TTL (this is the main reason I prefer 74LS chips over 74HC/HCT), but it's critical with
CMOS (otherwise you could fry the chip), and it's a good idea either way.  You don't need to worry about
unused outputs.