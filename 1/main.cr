content = File.read("input")

elves_snacks = content.split("\n\n")

elves_calories = elves_snacks.map do |snacks_list|
  snacks_list.split.map(&.to_i).sum
end

puts "Max: #{elves_calories.max}"

puts "Top three: #{elves_calories.sort[-3..].sum}"
