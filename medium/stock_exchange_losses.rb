# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i #number of stocks available
v = gets.split(" ").map &:to_i 
high = v[0]
low = v[0]
diff = 0
for i in 1..v.length-1
    cur = v[i]
    if cur > high 
        high = v[i]
        low = v[i]
    end
    if cur < low 
        low = v[i]
    end
    dif = high - low
    if high > low and dif > diff
        diff = dif
    end
end
puts -diff

