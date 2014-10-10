# Comparing two numbers written in index form like 2^11 and 3^7 is not
# difficult, as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
#
# However, confirming that 632382^518061 > 519432^525806 would be much more
# difficult, as both numbers contain over three million digits.
#
# Using data/99.txt, a 22K text file containing one thousand lines with a
# base/exponent pair on each line, determine which line number has the greatest
# numerical value.
#
# NOTE: The first two lines in the file represent the numbers in the example
# given above.

require './euler.rb'; include Euler
puts data_file('99.txt').read.split("\n")
          .map{|l| l.split(',').map(&:to_i)}
          .map{|base, exp| exp*Math.log(base)}
          .each.with_index.max.last+1

# => 709
# real    0m0.082s
# user    0m0.053s
# sys     0m0.028s
