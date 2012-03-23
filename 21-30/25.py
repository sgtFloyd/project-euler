# The Fibonacci sequence is defined by the recurrence relation:
# 
# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# 
#   F1 = 1
#   F2 = 1
#   F3 = 2
#   F4 = 3
#   F5 = 5
#   F6 = 8
#   F7 = 13
#   F8 = 21
#   F9 = 34
#   F10 = 55
#   F11 = 89
#   F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
# 
# What is the first term in the Fibonacci sequence to contain 1000 digits?

import math

PHI = (1 + math.sqrt(5)) / 2
DIGITS = 1000

print int(
        math.ceil(
          ((DIGITS-1) * math.log(10) + math.log(5) / 2) / math.log(PHI)
        )
      )

# => 4782
# real    0m0.014s
# user    0m0.008s
# sys     0m0.006s