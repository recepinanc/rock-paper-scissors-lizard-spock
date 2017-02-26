class Player
  
  EMPTY_STRING_CHECK_REGEX = /^\s*$/

  attr_accessor :name ,:score, :choice

  def initialize(params = {})
    @name = params.fetch(:name, "Guest")
    @score = params.fetch(:score, 0)
    @choice = params.fetch(:choice, nil)

    if (@name =~ EMPTY_STRING_CHECK_REGEX) == 0
      @name = "Guest"
    end
  end

  def won
    @score += 1
  end

  def lost
    @score -= 1
  end

  def compare(player_2)
    if @score != player_2.score
      @score > player_2.score ? self : player_2
    end
  end
end