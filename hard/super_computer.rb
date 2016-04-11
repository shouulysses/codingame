number = gets.to_i
task = []
# store each calculation in a array by start date and end date
number.times do |i|
    day, duration = gets.split(" ").collect {|x| x.to_i}
    task.push([day,day+duration])
end
# sort each calculation by end date
task.sort! {|a,b| a[1] <=> b[1]}

#fill a timeline whenever it is free
total = 0
current_day = 0
for i in 0...task.size
    if current_day == 0 or task[i][0] >= current_day
        total += 1
        current_day = task[i][1]
    end
end
        
puts total
