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
    puts yellow_color("Player 1 plays O position")
    puts yellow_color("Player 2 plays X position")    
    ['O', 'X']
  else
    puts red_color("Invalid choice. Please choose 'X' or 'O'. \u{1f344}")
    choose_position
  end
end


def turn(board, current_player)
  puts 'Please a number enter 1-9:'
  user_input = gets.chomp # got a move from User
  index = convert_input(user_input)   # converted it

  if valid_move?(board, index)         # check is it valid?
    move(board, index, current_player)
    display_board(board)
    if current_player == 'X'
      puts
      puts yellow_color("Player 2 your move")
      puts
    else
      puts
      puts yellow_color("Player 1 your move")
      puts
    end
  else
    puts red_color('You gave a wrong position move, only 1 to 9 ' + "\u{1f344}")
    turn(board, current_player)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

# filled board out or "x" or "o"
def full?(board)
  board.all? { |space| space == "X" || space == "O" }
end

# define what a tied game/board is.
def draw?(board)
  if !won?(board) && full?(board) # Board is full and there’s no winner
    true
  elsif !won?(board) && !full?(board) # Board is not full and there’s no winner
    false
  else won?(board) # There’s a winner, despite the board being empty or full
    false
  end
end

# If the game is tied or there’s a winner, let’s end the game.

def over?(board)
  won?(board) || draw?(board)
end

# Announcing the winner
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def draw_result
  loop do
    puts 'Play again?'
    answer = gets.chomp.downcase

    case answer
    when 'yes', 'y'
      board = initialize_board
      play(board)
      break
    when 'no', 'n'
      puts green_color('Thank you for playing! ' + "\u{1f60e}")
      break
    else  
      puts red_color('Invalid choice. Please choose yes/y or no/n ' + "\u{1f344}")
    end  
  end
end


def play(board)
  display_board(board)
  position = choose_position
  players = current_players(position)
  player_one = players[0]
  player_two = players[1]

  until over?(board)
    turn(board, player_one)
    break if over?(board)
    turn(board, player_two)
  end

  if won?(board)
    puts red_color("Congratulations #{winner(board)}!")
  elsif draw?(board)
    puts gray_color("Cats Game!") 
  end
  draw_result
end

board = initialize_board
play(board)
