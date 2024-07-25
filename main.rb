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