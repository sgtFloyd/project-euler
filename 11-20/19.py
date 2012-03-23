# You are given the following information, but you may prefer to do some research for yourself.
#
#   1 Jan 1900 was a Monday.
#   Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
#   A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
def dow(y, m, d): # year, month, day
  y -= m < 3
  return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7


print len([ 1 for year in xrange(1901, 2000)
              for month in xrange(1, 13)
                if dow(year, month, 1) == 1 ])

# => 171
# real    0m0.015s
# user    0m0.009s
# sys     0m0.006s