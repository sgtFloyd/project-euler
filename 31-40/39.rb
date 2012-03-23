# If p is the perimeter of a right angle triangle with integral length
# sides, {a,b,c}, there are exactly three solutions for p = 120.
#
#   {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p <= 1000, is the number of solutions maximised?

ps = {}
(1..998).each do |a|
  (a..998).each do |b|
    c = Math.sqrt(a**2 + b**2)
    next unless c%1 == 0
    p = (a+b+c).to_i
    next unless p <= 1000
    ps[p] ||= 0; ps[p] += 1
  end
end

puts ps.max_by{|k,v| v}[0]

# => 840
# real    0m0.311s
# user    0m0.307s
# sys     0m0.004s
