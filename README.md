# Tarot

This project contains scripts that draw tarot cards and place them into spreads.
Custom tarot decks and spreads are supported. 

Currently implemented in Perl, but I plan on implementing it in other languages
as a learning exercise.

## Dependencies

Requires `Math::Cartesian::Product` and `List::Util`

## Running

See [here](https://github.com/nathalie-tate/tarot/tree/master/perl)

## Defining Major Arcana

Major Arcana are defined by a list, separated by newlines. 

## Defining Minor Arcana

The first N lines of the file should be a hash character (#) followed by a suit 
name, where N is the number of suits.

The remaining lines should list the different values of the cards.

For example:
```
#Chalices
#Wands
1
2
3
```
Would create a deck containing `1 of Chalices`, `2 of Chalices`, `3 of
Chalices`, `1 of Wands`, `2 of Wands`, and `3 of Wands`.

## Defining Spreads

Spreads are defined by rectangular matrices, where cards are represented by two
digits (ex: `01`, `02`) and spaces are represented by two periods (`..`). Cards
should be separated by at least one space (`..`). Failing to do so may lead to
undefined behavior.
