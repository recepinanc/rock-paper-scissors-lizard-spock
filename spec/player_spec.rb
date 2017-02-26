require './lib/rpsls/player'

RSpec.describe Player do
	let(:player_1) { Player.new(name: 'Player 1')}
	describe "Score change" do
		context "when player wins" do
			it "score increases" do
				expect { player_1.won }.to change{player_1.score}.by(1)
			end
		end
		context "when player loses" do
			it "score decreases" do
				expect { player_1.lost }.to change{player_1.score}.by(-1)
			end
		end
	end
end
