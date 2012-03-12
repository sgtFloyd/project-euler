# Using data/22.txt, a 46K text file containing over five-thousand
# first names, begin by sorting it into alphabetical order. Then working
# out the alphabetical value for each name, multiply this value by its
# alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?

print sum([
        sum([
          ord(char)-64
            for char in name
        ]) * (index+1)
          for index, name
          in enumerate(
            sorted(
              open('data/22.txt')
              .read()
              .replace('"', '')
              .split(',')
            )
          )
      ])

# => 871198282
# real    0m0.031s
# user    0m0.024s
# sys     0m0.006s
