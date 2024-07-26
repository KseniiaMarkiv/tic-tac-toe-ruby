require_relative 'board'
require_relative 'player'
require_relative 'colorize_helper'

class Game
  include ColorizeHelper
  include Symbols

  def initialize
    @board = Board.new
    position = choose_position
    @players = assign_positions(position)
    @current_player = @players.first
  end

  def play
    @board.display_board
    until @board.over?
      take_turn
      switch_players
    end
    display_result
    play_again?
  end

  private
  def choose_position
    puts 'Choose your position X or O:'
    position = gets.chomp.upcase
    until %w[X O].include?(position)
      puts ColorizeHelper.red_color('Invalid input. Please enter a valid string of X or O ' + MUSHROOM_EMOJI)
      position = gets.chomp.upcase
    end
    position
  end

  def assign_positions(position)
    if position == 'X'
      puts ColorizeHelper.yellow_color("Player 1 plays X position")
      puts ColorizeHelper.yellow_color("Player 2 plays O position")
      [Player.new('X'), Player.new('O')]
    elsif position == 'O'
      puts ColorizeHelper.yellow_color("Player 1 plays O position")
      puts ColorizeHelper.yellow_color("Player 2 plays X position")    
      [Player.new('O'), Player.new('X')]
    else
      puts ColorizeHelper.red_color("Invalid choice. Please choose 'X' or 'O'." + MUSHROOM_EMOJI)
      choose_position
    end
  end

  def take_turn
    puts 'Please enter a number 1-9:'
    index = convert_input(gets.chomp)
    if @board.valid_move?(index)
      @board.move(index, @current_player.marker)
      @board.display_board
      display_turn_message
    else
      puts ColorizeHelper.red_color("You gave a wrong position move, only 1 to 9 " + MUSHROOM_EMOJI)
      take_turn
    end
  end

  def convert_input(user_input)
    user_input.to_i - 1
  end

  def display_turn_message
    if @current_player.marker == 'X'
      puts ColorizeHelper.yellow_color("Player 2 your move")
    else
      puts ColorizeHelper.yellow_color("Player 1 your move")
    end
  end

  def switch_players
    @current_player = (@current_player == @players.first) ? @players.last : @players.first
  end

  def display_result
    if @board.won?
      puts ColorizeHelper.green_color("Congratulations! #{@board.winner} has won the game.")
    elsif @board.draw?
      puts ColorizeHelper.gray_color("Cats Game!")
    end
  end

  def play_again?
    puts 'Play again? (yes/no)'
    answer = gets.chomp.downcase
    if %w[yes y].include?(answer)
      Game.new.play
    elsif %[no n].include?(answer)
      puts ColorizeHelper.green_color('Thank you for playing!')
    else
      puts ColorizeHelper.red_color("Invalid choice. Please choose yes/y or no/n " + MUSHROOM_EMOJI)
      play_again?
    end
  end
end
