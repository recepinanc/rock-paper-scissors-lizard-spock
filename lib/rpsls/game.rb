require 'io/console'

class Game
  attr_accessor :total_turns, :player_1, :player_2, :choice_fight

  def initialize(options = {})
    @total_turns = options.fetch(:total_turns, 1)
    @players = {}
    @choice_fight = Choice.new
    setup
  end

  def setup
    puts "How many rounds will you play ?"
    @total_turns = gets.chomp.to_i
    new_players
    play
  end

  def new_players(count = 2)
    count.times do |i|
      puts "Player #{i + 1}, enter your name: "
      instance_variable_set("@player_#{i + 1}", Player.new(name: gets.chomp))
    end
  end

  def play
    @total_turns.times do |i|
      puts "\n\nROUND #{i+1}!\n\n"
      turn
      fight
    end
    finish
  end

  def turn
    [@player_1, @player_2].each do |player|
      puts "It's #{player.name}'s turn! What's your choice ?"
      puts "1. Rock\n2. Paper\n3. Scissors\n4. Lizard\n5. Spock\n\n"
      
      # To make the player choice invisible
      player.choice = STDIN.noecho(&:gets).chomp.to_i % 5
    end
  end

  def fight
    choice_1 = @player_1.choice - 1
    choice_2 = @player_2.choice - 1

    case @choice_fight.win_lose(choice_1, choice_2)
    when 0
      @player_2.won
    when 2
      @player_1.won
    end

    puts @choice_fight.results(choice_1, choice_2)
    puts "\nSCORES : #{@player_1.name} : #{@player_1.score} , #{@player_2.name} : #{@player_2.score}"
  end

  def winner
   @player_1.compare(@player_2)
  end

  def finish
    if winner
      puts "\n\n#{winner.name} has won! Congratulations!"
    else
      puts "Tie! GAME ENDED."
    end
  end
end