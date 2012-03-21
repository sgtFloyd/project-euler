# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

print str(
        sum(
          [i**i for i in xrange(1,1001)]
        )
      )[-10:]

# => 9110846700
# real    0m0.050s
# user    0m0.043s
# sys     0m0.006s
