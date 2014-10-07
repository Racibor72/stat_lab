#get data
f = File.new("unemploy_per_mounth.csv", "r")
unemploy_per_mounth = f.readlines
f.close
#array-a-fy
sum = 0
count = 0
unemploy_per_mounth.each do |unemploy_per_mounth|
	sum = sum + unemploy_per_mounth.split(",")[1].to_f
	count = count + 1
end

#Varience 
mean = sum/count
sum_varience = 0
unemploy_per_mounth.each do |unemploy_per_mounth|
	varient = mean - unemploy_per_mounth.split(",")[1].to_f
	varience = varient ** 2 
	sum_varience += varience
end
#Diveation

diveation = (sum_varience/count)**0.5
z_score = 0 
z_scores = []
unemploy_per_mounth.each do |unemploy_per_mounth|
	unemploy_per_mounth = unemploy_per_mounth.split(",")[1].to_f
	z_score = (unemploy_per_mounth - mean)/diveation
	z_scores.push z_score
	z_score_file = File.new("z_scores","w")
	z_scores.join(',')
	z_score_file.close
end

#Info
puts "Sum is #{sum}"
puts "Count is #{count}"
puts "Mean is #{mean}"
puts "The Sum Of Varients is #{sum_varience}"
puts "The Diveation is #{diveation}"
#varients 
 
