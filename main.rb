require 'colorize'

WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
  [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
  [0, 4, 8], [2, 4, 6]             # Diagonals
]

# * colorizing methods

def blue_color(string)
  string.colorize(:blue)
end

def yellow_color(string)
  string.colorize(:yellow)
end

def green_color(string)
  string.colorize(:green)
end

def red_color(string)
  string.colorize(:red)
end

def gray_color(string)
  string.colorize(:gray)
end


# we need to wrap in method cuz this array with refresh every time by chosen yes
def initialize_board
  Array.new(9, ' ')
end

def display_board(board)
  puts blue_color(" #{board[0]}") + ' | ' + blue_color("#{board[1]}") + ' | ' + blue_color("#{board[2]} ")
  puts '-----------'
  puts blue_color(" #{board[3]}") + ' | ' + blue_color("#{board[4]}") + ' | ' + blue_color("#{board[5]} ")
  puts '-----------'
  puts blue_color(" #{board[6]}") + ' | ' + blue_color("#{board[7]}") + ' | ' + blue_color("#{board[8]} ")
end

# To convert the user input
def convert_input(user_input)
  user_input.to_i - 1
end

# Make a move
def move(board, index, player)
  board[index] = player
  if player == 'X'
    puts yellow_color("Player 2 your move")
  else
    puts yellow_color("Player 1 your move")
  end
end

# validate a square that’s already taken
def position_taken?(board, index)
  if (board[index] == ' ') || (board[index] == '') || board[index].nil?
    return false 
  else
    return true   # cuz position is taken by x || o - not empty String "" || " ", and not nil
  end
end

# we validate the user’s input 
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def choose_position
  puts 'Choose your position X or O:'
  position = gets.chomp.upcase
  until %w[X O].include?(position)
    puts red_color('Invalid input. Please enter a valid string of X or O ' + "\u{1f344}")
    position = gets.chomp.upcase
  end
  position
end

# Assign positions to current players
def current_players(position)
  if position == 'X'
    puts yellow_color("Player 1 plays X position")
    puts yellow_color("Player 2 plays O position")
    ['X', 'O']
  elsif position == 'O'
    puts yellow_color("Player 2 plays O position")
    puts yellow_color("Player 1 plays X position")    
    ['O', 'X']
  else
    puts red_color("Invalid choice. Please choose 'X' or 'O'. \u{1f344}")
    choose_position
  end
end


