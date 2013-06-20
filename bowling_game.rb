class Game

  def initialize
    @rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    frame_index = 0
    0.upto(9) do |frame| 
      if strike?(frame_index)
        score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        score += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        score += @rolls[frame_index] + @rolls[frame_index + 1]
        frame_index += 2
      end
    end
    return score
  end

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def sum_of_balls_in_frame(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def spare_bonus(frame_index)
    @rolls[frame_index + 2]
  end

  def strike_bonus(frame_index)
    @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end

end
