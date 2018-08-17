#!/usr/bin/ruby

def printRow(row)
  cards = []
  slots = row.scan(/../)
  count = row.scan(/\d\d/).length

  for i in 0..count-1
    cards.push($deck.pop())
  end

  for i in (0..16)
    cardNum = cards.length
    for slot in (0..slots.length-1)
      if((defined? slots[slot]) && !(slots[slot].match(/\d\d/).nil?))
        cardNum-=1
        tmp = cards[cardNum]
        tmp ||= ""
        len = tmp.length

        if(len % 2) != 0
          tmp += " "
        end

        if(i == 0 || i == 16)
          print "+" + ("-"*26) + "+"
        elsif( i < 4 || i > 4)
          print "|" + (" "*26) + "|"
        elsif( i == 4 )
          #if (cardNum > 0)
            print "|" + (" "*((26-len)/2)) + tmp + (" "*((26-len)/2)) + "|" 
          #end
        end

      else
        print (" "*28)
      end
    end
    puts ""
  end
end

majorF = ARGV[0]
minorF = ARGV[1]
spreadF = ARGV[2]

major = File.read(majorF).split("\n")
minor = File.read(minorF).split("\n")
spread = File.read(spreadF).split("\n")

$deck = [] 
suits = []

for i in minor
  suits.unshift($1) if i =~ /#(.+)/;
end
for i in suits
  minor.shift
end 

for suit in suits
  for card in minor
    $deck.push("#{card} of #{suit}");
  end
end

$deck += major
$deck.shuffle!

for i in spread
  printRow(i)
end

