# Win OR Lose Matrix

# Since the first choice will select the row and compare it with other choices, result will be from first choice's perspective
# 0 -> Lose! (First Choice Loses...)
# 1 -> Tie!
# 2 -> Win! (First Choice Wins!)
#
# Basically I draw this matrix since their affect on each other was too diverse to represent with power,strength etc. variables
# Seems working to me right now.
#
# x   r   p   s   l   s 
#
# r   1   0   2   2   0
#
# p   2   1   0   0   2
#
# s   0   2   1   2   0
#
# l   0   2   0   1   2
#
# s   2   0   2   0   1

class Choice
  attr_accessor :results

  def initialize
    @win_lose_matrix = win_lose_matrix
    @results = set_results
  end

  def win_lose_matrix
    @win_lose_matrix = [
      [1,0,2,2,0],
      [2,1,0,0,2],
      [0,2,1,2,0],
      [0,2,0,1,2],
      [2,0,2,0,1]
    ]
  end

  def set_results
    @results = [
      ["Tie!","Paper covers Rock!","Rock crushes Scissors!","Rock crushes Lizard!","Spock vaporizes Rock!"],
      ["Paper covers Rock!","Tie","Scissors cuts Paper!","Lizard eates Paper!","Paper disproves Spock!"],
      ["Rock crushes Scissors!","Scissors cuts Paper!","Tie!","Scissors decapitates Lizard!","Spock smashes Scissors!"],
      ["Rock crushes Lizard!","Lizard eates Paper!","Scissors decapitates Lizard!","Tie!","Lizard poisons Spock!"],
      ["Spock vaporizes Rock!","Paper disproves Spock!","Spock smashes Scissors!","Lizard poisons Spock!","Tie!"]
    ]
  end

  def win_lose(choice_1, choice_2)
    @win_lose_matrix[choice_1][choice_2]
  end

  def results(choice_1, choice_2)
    @results[choice_1][choice_2]
  end
end