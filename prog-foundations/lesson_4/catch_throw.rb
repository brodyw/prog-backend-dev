floor = [["blank", "blank", "blank"],
         ["gummy", "blank", "blank"],
         ["blank", "blank", "blank"]]

attempts = 0
candy = nil
catch(:found) do
	floor.each do |row|
  	row.each do |tile|
      attempts += 1
    	if tile == "jawbreaker" || tile == "gummy"
        candy = tile
      end
  	end
	end
end
puts candy
puts attempts