STDOUT.sync = true # DO NOT REMOVE
# Don't let the machines win. You are humanity's last hope...

@width = gets.to_i # the number of cells on the X axis
@height = gets.to_i # the number of cells on the Y axis
coor = Hash.new
@height.times do |y|
    line = gets.chomp.split(//) # width characters, each either 0 or .
    for x in 0..line.size
        if line[x] == '0'
            coor["#{x}#{y}"] = [x,y] #hash 
        end
    end
end

coor.each_value {|value|
    print "#{value[0]} #{value[1]} "
    printX = false
    printY = false
    for i in value[0]+1...@width
        if coor.has_key? "#{i}#{value[1]}"
            print "#{i} #{value[1]} "
            printX = true
            break
        end
    end
    if !printX
        print "-1 -1 "
    end
    for j in value[1]+1..@height
        if coor.has_key? "#{value[0]}#{j}"
            puts "#{value[0]} #{j}"
            printY = true
            break
        end
    end
    if !printY
        puts "-1 -1"
    end
}
    

