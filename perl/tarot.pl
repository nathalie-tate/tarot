#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw/shuffle/;

my $major = $ARGV[0];
my $minor = $ARGV[1]; 
my $spread = $ARGV[2];

open MajorFH, "<", $major or die;
open MinorFH, "<", $minor or die;
open SpreadFH, "<", $spread or die;

my @major = <MajorFH>;
my @minor = <MinorFH>; 
my @spread = <SpreadFH>;

my @suits;

for(@minor)
{
  chomp;
  unshift @suits,($1) if $_ =~ /#(.+)/ ;
};

shift @minor for @suits;
chomp for @major;
chomp for @spread;

my @deck;

for my $m (@minor)
{
  for my $s (@suits)
  {
    push @deck, "$m of $s";
  }
}

@deck = (@deck, @major);
@deck = shuffle(@deck);

printRow($_) for @spread;

sub printRow
{
  my $row = shift;
  my @cards;
  my @slots = $row =~ /../g;

  my $count = () = $row =~ /(\d\d)/g;

  for (0..$count)
  {
    push @cards, pop @deck;
  }

  for my $i (0..16)
  {
    my $cardNum = @cards;
    for my $slot(0..@slots-1)
    {
      if($slots[$slot] and $slots[$slot] =~ /\d\d/)
      {
        my $tmp = $cards[--$cardNum];
        my $len = length $tmp;
        if($len%2)
        {
          $tmp.=" ";
        }

        if ($i == 0 || $i == 16)
        {
          print "+" . ("-"x26) . "+";
        }
        elsif( $i < 4 || $i > 4)
        {
          print "|". (" "x26) . "|";
        }
        elsif($i == 4)
        {
          print "|" .(" "x((26 - $len)/2)). $tmp .(" "x((26- $len)/2)). "|" if $cardNum;
        }
        else
        {
          die;
        }
      }
      else
      {
        print " "x28;
      }
    }
    print "\n"; 
  }
}
