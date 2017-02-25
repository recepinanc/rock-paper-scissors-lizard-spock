require 'io/console'

class Game
  attr_accessor :total_turns, :player_1, :player_2

  def initialize(options = {})
    @total_turns = options.fetch(:total_turns, 1)
    setup
  end

  def setup
    puts "How many rounds will you play ?"
    @total_turns = gets.chomp.to_i
    new_players
    play
  end

  def new_players
    puts "Player 1, enter your name: "
    player_1_name = gets.chomp
    @player_1 = Player.new(name: player_1_name)
    puts "Player 2, enter your name: "
    player_2_name = gets.chomp
    @player_2 = Player.new(name: player_2_name)
  end

  def play
    @total_turns.times do |i|
      puts "ROUND #{i+1}!\n"
      turn
      fight
    end
    finish
  end

  def turn
    [@player_1, @player_2].each do |player|
      puts "It's #{player.name}'s turn! What's your choice ?"
      puts "1. Rock\n2. Paper\n3. Scissors\n4. Lizard\n5. Spock\n"
      # To make the player choice invisible
      player.choice = STDIN.noecho(&:gets).chomp.to_i % 5
    end
  end

  def fight
    choice_fight = Choice.new
    result = choice_fight.win_lose(@player_1.choice-1, @player_2.choice-1)
    if result == 0
      @player_1.lost
      @player_2.won
      puts choice_fight.results(@player_1.choice-1, @player_2.choice-1)
    elsif result == 2
      @player_1.won
      @player_2.lost
      puts choice_fight.results(@player_1.choice-1, @player_2.choice-1)
    else
      puts "Tie!"
    end
    puts "SCORES : #{@player_1.name} : #{@player_1.score} , #{@player_2.name} : #{@player_2.score}"
  end

  def winner
   @player_1.compare(@player_2)
  end

  def finish
    if winner
      puts "#{winner.name} has won! Congratulations!"
    else
      puts "Tie! GAME ENDED."
    end
  end
end