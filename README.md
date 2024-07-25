# Ruby Tic-Tac-Toe Game

This is a command-line Tic-Tac-Toe game implemented in Ruby, using the 'colorize' gem for enhanced color-coded output. The game supports two players who take turns selecting positions on a 3x3 board, aiming to align three of their marks (either 'X' or 'O') in a row, column, or diagonal. The game includes features to validate moves, detect wins and draws, and prompt for replay.

----------------------------------
## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [How to Play](#how-to-play)
- [Code Overview](#code-overview)
- [Example](#example)
- [Acknowledgments](#acknowledgments)


## Installation

1. Ensure you have Ruby installed on your system. You can download it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

2. Install the 'colorize' gem by running:
   ```sh
   gem install colorize
   ```

## Usage

1. Clone this repository to your local machine:
   ```sh
   git clone https://github.com/KseniiaMarkiv/tic-tac-toe-ruby.git
   cd tic-tac-toe-ruby
   ```

2. Run the game:
   ```sh
   ruby main.rb
   ```


## How to Play

1. The game will prompt Player 1 to choose their mark ('X' or 'O').
2. Players take turns entering their move by selecting a position on the board (1-9).
3. The board positions are numbered as follows:

   ```
    1 | 2 | 3
   -----------
    4 | 5 | 6
   -----------
    7 | 8 | 9
   ```

4. The game checks for valid moves and updates the board accordingly.
5. The game detects win conditions and announces the winner, or declares a draw if the board is full without a winner.
6. After the game ends, players are prompted to play again or exit.


## Code Overview

- `initialize_board`: Initializes an empty 3x3 board.
- `display_board`: Displays the current state of the board with color-coded output.
- `convert_input`: Converts user input to the corresponding board index.
- `move`: Updates the board with the player's move.
- `position_taken?`: Checks if a position on the board is already taken.
- `valid_move?`: Validates if a move is within the board and the position is not taken.
- `choose_position`: Prompts the player to choose their mark.
- `current_players`: Assigns marks to the players based on the chosen position.
- `turn`: Manages the player's turn, validates the move, updates the board, and prompts the next player.
- `won?`: Checks if there's a winning combination on the board.
- `full?`: Checks if the board is full.
- `draw?`: Checks if the game is a draw.
- `over?`: Determines if the game is over (win or draw).
- `winner`: Announces the winner if there's a winning combination.
- `draw_result`: Prompts the players to play again or exit.
- `play`: Main game loop that manages the game flow.

## Example

Here is a snippet of how the game might look during play:

![alt text](https://github.com/KseniiaMarkiv/tic-tac-toe-ruby/blob/main/example_game_output.png?raw=true)

## Acknowledgments

- Thanks to the creators of the 'colorize' gem for making terminal output more colorful and engaging.