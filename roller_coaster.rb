places, rides, groups = gets.split(" ").collect {|x| x.to_i}
STDERR.puts("places: #{places},rides: #{rides},groups #{groups}")
people = []
groups.times do
    people.push(gets.to_i)
end
# if total of people <= number of places in the attraction, total can be easily calculated
if ((temp = people.reduce(:+)) <= places)
   puts temp * rides 
else
    answer = 0
    current = 0
    count = 0
    remainingRides = rides
    maps = {groups=>[0,0]}
  
    rides.times{ |i|
        currentLength = places
        while currentLength >= people[count]
            currentLength -= people[count]
            answer += people[count]
            count = (count + 1) % groups
        end
        if rides > 1000000 and maps.has_key?(count)
            #found the pattern
            block = i - maps[count][0]
            answer = (rides-maps[count][0])/block * (answer-maps[count][1])        
            remainingRides = maps[count][0] + (rides-maps[count][0])/block*block+1
            break
        else   
            #storing all the patterns into map to find where the loop starts
            maps[count] = [i, answer]
        end
    }
    if(rides > remainingRides)
        answer += maps[count][1]
    end
    (remainingRides...rides).each{ |i|
        currentLength = places
        while currentLength >= people[count]
            currentLength -= people[count]
            answer += people[count]
            count = (count + 1) % groups
        end
    }
end

puts answer
