STDOUT.sync = true # DO NOT REMOVE

@surface_n = gets.to_i # the number of points used to draw the surface of Mars.

land_x = []
land_y = []
@surface_n.times do |i|
    # land_x: X coordinate of a surface point. (0 to 6999)
    # land_y: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
    input = gets.split(" ").collect {|x| x.to_i}
    land_x[i] = input[0]
    land_y[i] = input[1]
    # determine the flat ground
    if i > 0 and land_y[i] == land_y[i-1]
        @flat_left = land_x[i-1]
        @flat_right = land_x[i]
        @flat_height = land_y[i]
    end
end
STDERR.puts @flat_left
STDERR.puts @flat_right
# game loop
loop do
    # h_speed: the horizontal speed (in m/s), can be negative.
    # v_speed: the vertical speed (in m/s), can be negative.
    # fuel: the quantity of remaining fuel in liters.
    # rotate: the rotation angle in degrees (-90 to 90).
    # power: the thrust power (0 to 4).
    x, y, h_speed, v_speed, fuel, rotate, power = gets.split(" ").collect {|x| x.to_i}
    
    # identify if the shuttle locates within the flat ground range
    range = x <= @flat_right and x >= @flat_left
    
    # no horizontal speed, land vertically
    angle = 0
    
    # degree 22 keeps the ship to be horizontal
    # opposite direction if it is going too fast
    # when the ship is on the right
    if x >= @flat_right 
        if h_speed >= -60
            angle = 22
        else
            angle = -22
        end

    # when the ship is on the left    
    elsif x <= @flat_left 
        if h_speed <= 60
            angle = -22
        else
            angle = 22
        end

    # when the initial speed is too fast, slow it down before trying to land
    elsif range
        if h_speed > 66
            angle = 22
        elsif h_speed < -66
            angle = -22
        #trying to reduce the horizontal speed and at the same time not letting it landing too fast
        elsif h_speed > 20
            angle = 85
        elsif h_speed < -20
            angle = -85
        # slowly reduce the horizontal speed while it is within the flat ground range
        elsif h_speed > 0 and y - @flat_height > 500
            angle = 5
        elsif h_speed < 0 and y - @flat_height > 500
            angle = -5  
        end
    end
    
    # when there is angle, the should be booster          
    if angle != 0 
        boost = 4
    # avoid going too fast when it is very close the ground
    elsif y - @flat_height < 300
        boost = 4
    
    # regulate the speed to avoid landing too fast
    elsif v_speed < -39 and y - @flat_height < 2250
        boost = 4
    elsif v_speed < -42
        boost = 3
    elsif v_speed < -35
        boost = 2
    else
        boost = 0
    end
    
    puts "#{angle} #{boost}"
  
   
end
