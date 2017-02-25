class Player
  
  attr_accessor :name ,:score, :choice

  def initialize(params = {})
    @name = params.fetch(:name, "Guest")
    @score = params.fetch(:score, 0)
    @choice = params.fetch(:choice, nil)
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