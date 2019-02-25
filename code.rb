def alphabet_war(fight) #"z*z*z*zs"
  
  sides= Hash.new
  sides[:right] = {"m":4, "q":3, "d":2, "z":1}
  sides[:left] = {"w":4, "p":3, "b":2, "s":1}
  
  if fight.length == 1
    winner = sides.select {|k| k.values.include?(fight.to_sym)}
    puts "#{winner.to_s.upcase} + side wins!"
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
    
  end #fight.length
end #method
  
 
  
  
