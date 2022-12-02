total_score = 0

# we could play with chars ASCII code here, but the code would be too magical
letter_to_shape = {
  "A" => Rock,
  "B" => Paper,
  "C" => Scissors,
}

abstract class Shape
  def score_against(other : Shape)
    # draw
    return 3 if other.class == self.class

    # won
    return 6 if other.class == self.beats

    # lost
    return 0 if other.class == self.beats.new.beats

    raise "shouldn't happen"
  end

  def find_my_move(letter : String)
    if letter == "X"
      # need to lose
      self.beats.new
    elsif letter == "Y"
      # need to draw
      self.class.new
    elsif letter == "Z"
      # need to win
      self.beats.new.beats.new
    else
      raise "shouldn't happen"
    end
  end
end

class Rock < Shape
  property shape_score = 1
  property beats = Scissors
end

class Paper < Shape
  property shape_score = 2
  property beats = Rock
end

class Scissors < Shape
  property shape_score = 3
  property beats = Paper
end

File.read_lines("input").each do |line|
  other_letter, victory_letter = line.split
  other_shape = letter_to_shape[other_letter].new
  my_shape = other_shape.find_my_move(victory_letter)

  round_shape_score = my_shape.shape_score
  round_victory_score = my_shape.score_against(other_shape)

  total_score += round_shape_score
  total_score += round_victory_score
end

puts "Total score: #{total_score}"
