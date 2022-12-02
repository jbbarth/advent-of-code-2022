total_score = 0

# we could play with chars ASCII code here, but the code would be too magical
letter_to_class = {
  "X" => Rock,
  "Y" => Paper,
  "Z" => Scissors,
  "A" => Rock,
  "B" => Paper,
  "C" => Scissors,
}

abstract class Shape
  def score_against(other : Shape)
    # draw
    return 3 if other.shape_score == self.shape_score

    # won
    return 6 if other.shape_score % 3 == (self.shape_score - 1)

    # lost
    return 0
  end
end

class Rock < Shape
  property shape_score = 1
end

class Paper < Shape
  property shape_score = 2
end

class Scissors < Shape
  property shape_score = 3
end

File.read_lines("input").each do |line|
  other_letter, my_letter = line.split
  other_shape = letter_to_class[other_letter].new
  my_shape = letter_to_class[my_letter].new

  round_shape_score = my_shape.shape_score
  round_victory_score = my_shape.score_against(other_shape)

  total_score += round_shape_score
  total_score += round_victory_score
end

puts "Total score: #{total_score}"
