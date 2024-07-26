class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_position
    puts 'Choose your position 1-9:'
    gets.chomp.to_i - 1
  end
end
