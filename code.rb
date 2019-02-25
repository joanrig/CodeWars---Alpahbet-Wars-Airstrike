def alphabet_war(fight) #"z*z*z*zs"
  
  sides= Hash.new
  sides[:right] = {"m":4, "q":3, "d":2, "z":1}
  sides[:left] = {"w":4, "p":3, "b":2, "s":1}

  if fight.length == 1
    if sides[:right].keys.include?(fight)
      winner = "Right"
    if sides[:left].keys.include?(fight)
      winner = "Left"
    end
    winner + " side wins!"
  
  else 
    #find all bomb spots by index
    bomb_spot = (0 ... fight.length).find_all {|i| fight[i] == "*"} # => [1, 3, 5]
  
    #replace bomb spots & adj spots with "_"
    bomb_spot.each do |spot|
      if spot == 0
        fight[spot...spot+1] = " "
      elsif spot == fight.length - 1
        fight[spot-2...spot] = " "   
      else
        fight[spot-1...spot+1] = " "
      end 
    end
      #=>" z  s"
    
    #assign survivors/points to their sides
    right_pts = []
    left_pts = []
      
    fight.scan(/./).each do |survivor|
      sides[:right].each do |k,v|
        if survivor.to_sym == k
          right_pts<< v.to_i
        end
      end
    end
      
    fight.scan(/./).each do |survivor|
      sides[:left].each do |k,v|
        if survivor.to_sym == k
          left_pts<< v.to_i
        end
      end
    end
    
    return "Let's fight again!"  if right_pts.sum == left_pts.sum
    
    right_pts.sum > left_pts.sum ? "Right side wins!" : "Left side wins!"  
  end #fight.length
end #method
end
