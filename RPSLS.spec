b = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "RPSLS"
  spec.version       = '1.0'
  spec.authors       = ["Recep İnanç"]
  spec.email         = ["recepinancc@gmail.com"]
  spec.summary       = %q{Rock Paper Scissors Lizard Spock Console Game.}
  spec.description   = %q{This game is an extended version of Rock Paper Scissors. There are 2 additional types: Lizard and Spock. Inspired by The Big Bang Theory (Sheldon).}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "GNU"

  spec.files         = ['lib/RPSLS.rb']
  spec.executables   = ['bin/RPSLS']
  spec.test_files    = ['tests/test_RPSLS.rb']
  spec.require_paths = ["lib"]
end
