# Component selecton

One of the most daunting parts of digital design, is choosing the components you'll use, simply because there
are sooooo many that seem to do the same thing.  As an example, let me go pull up a [Jameco search for NAND gates](https://www.jameco.com/shop/StoreCatalogDrillDownView?langId=-1&storeId=10001&catalogId=10001&freeText=NAND%20gate&search_type=jamecoall), aaand

<img src="/images/jameco_nand_search.png" />

Yup, 65 results.  That's gonna be daunting,
especially if you don't know the difference between a 74LS00, a CD4011, and a
74HC00, but fortunately, sites like
Jameco have a search filter tool.  Fortunately, this particular case is pretty simple: I recommend
74LS, because it's fairly hard to screw up.

## Compatibility

If you're using devices from the same logic family (e.x. TTL devices such as 74LS, or CMOS devices such as 74HC),
you'll be fine.  (I should note: these logic families aren't a hard and fast rule - 74HCT, not to
be confused with 74HC, uses TTL levels for compatibility, even though it's logic is CMOS.)

The main thing you need to check is the
signal voltages each device uses.

Each device has 4 voltages: $V_{IH}$, $V_{OH},
$V_{IL}$, and $V_{OL}$, and you need to make
sure that these are compatible.  In short,
make sure that $V_{OH}>V_{IH}$, and 
$V_{OL}<V_{IL}$.

TTL commonly has much wider ranges than CMOS, and since CMOS can tend to draw very high power levels if its inputs
are out of range, it's best to be careful.  

As an example of the ranges used by a variety of logic families, take this chart from StackExchange, though note
that none of the ranges are a hard and fast rule:

<img src="https://i.stack.imgur.com/au4vN.png" />

## A word on breaking stuff

I have some bad news and some good news.

The bad news: **you are going to break somethng**, eventually.

The good news: **components are inexpensive.**  Those 74x chips are a dollar each.

You'll do a lot more learning, and have a lot more fun, breaking the occasional
component, than you will obsessing over whether or not two components are compatible.
Save the obsessing over breaking stuff, for your boss.