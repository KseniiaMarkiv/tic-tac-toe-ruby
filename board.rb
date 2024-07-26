require_relative 'colorize_helper'
require_relative 'symbols'

class Board
  include ColorizeHelper
  include Symbols

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, ' ')
  end

  def display_board
    puts blue_color(" #{cells[0]}") + ' | ' + blue_color("#{cells[1]}") + ' | ' + blue_color("#{cells[2]} ")
    puts '-----------'
    puts blue_color(" #{cells[3]}") + ' | ' + blue_color("#{cells[4]}") + ' | ' + blue_color("#{cells[5]} ")
    puts '-----------'
    puts blue_color(" #{cells[6]}") + ' | ' + blue_color("#{cells[7]}") + ' | ' + blue_color("#{cells[8]} ")
  end

  def position_taken?(index)
    if (cells[index] == ' ') || (cells[index] == '') || cells[index].nil?
      return false 
    else
      return true   # cuz position is taken by x || o - not empty String "" || " ", and not nil
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  # Make a move
  def move(index, player)
    cells[index] = player
  end

  # filled board out or "x" or "o"
  def full?
    cells.all? { |space| space == 'X' || space == 'O' }
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      cells[combo[0]] == cells[combo[1]] &&
      cells[combo[1]] == cells[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  # define what a tied game/board is.
  def draw?
    if !won? && full? # Board is full and there’s no winner
      true
    elsif !won? && !full? # Board is not full and there’s no winner
      false
    else won? # There’s a winner, despite the board being empty or full
      false
    end
  end

  # If the game is tied or there’s a winner, let’s end the game.
  def over?
    won? || draw?
  end

  # Announcing the winner
  def winner
    if winning_combo = won?
      cells[winning_combo.first]
    end
  end
end
