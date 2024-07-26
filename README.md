# Ruby Tic-Tac-Toe Game

This is a command-line Tic-Tac-Toe game implemented in Ruby, using the 'colorize' gem for enhanced color-coded output. The game supports two players who take turns selecting positions on a 3x3 board, aiming to align three of their marks (either 'X' or 'O') in a row, column, or diagonal. The game includes features to validate moves, detect wins and draws, and prompt for replay.
> [!NOTE]
> in the next couple of months, I will implement this project on Ruby on Rails.
> 
> and will put a link here
----------------------------------
## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [How to Play](#how-to-play)
- [Code Overview](#code-overview)
- [Example](#example)
- [Acknowledgments](#acknowledgments)
- [Refactoring Process](#refactoring-process)


## Installation

1. Ensure you have Ruby installed on your system. You can download it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

2. Install the 'colorize' gem by running:
   ```sh
   gem install colorize
   ```

## Usage

1. **Clone this repository to your local machine:**
   ```sh
   git clone https://github.com/KseniiaMarkiv/tic-tac-toe-ruby.git
   cd tic-tac-toe-ruby
   ```

2. **Switch branch to oop**
   ```sh
   git checkout oop
   ```
3. **Run the game:**
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

### Directory Structure

- `board.rb`: Handles the game board logic.
- `player.rb`: Manages player details and interactions.
- `game.rb`: Orchestrates the game logic.
- `colorize_helper.rb`: Contains colorizing methods.
- `main.rb`: This file starts the game.

### Methods Overview

- Board Class

- `initialize`: Initializes an empty 3x3 board.
- `display_board`: Displays the current state of the board with color-coded output.
- `position_taken?`: Checks if a position on the board is already taken.
- `valid_move?`: Validates if a move is within the board and the position is not taken.
- `move`: Updates the board with the player's move.
- `full?`: Checks if the board is full.
- `won?`: Checks if there's a winning combination on the board.
- `draw?`: Checks if the game is a draw.
- `over?`: Determines if the game is over (win or draw).
- `winner:` Announces the winner if there's a winning combination.

- Player Class 

- `initialize`: Initializes a player with a marker ('X' or 'O').

- Game Class 

- `initialize`: Initializes the game with a board and players.
- `play`: Main game loop that manages the game flow.
- `choose_position`: Prompts the player to choose their marker.
- `assign_positions`: Assigns markers to the players based on the chosen position.
- `take_turn`: Manages the player's turn, validates the move, updates the board, and prompts the next player.
- `convert_input`: Converts user input to the corresponding board index.
- `display_turn_message`: Displays whose turn it is next.
- `switch_players`: Switches the current player.
- `display_result`: Displays the result of the game (win or draw).
- `play_again`?: Prompts the players to play again or exit.

### Colorize Helper and Symbols Modules

- Methods for colorizing strings: `blue_color`, `yellow_color`, `green_color`, `red_color`, `gray_color`.
- Assign symbols to constant.

## Example

Here is a snippet of how the game might look during play:

![alt text](https://github.com/KseniiaMarkiv/tic-tac-toe-ruby/blob/main/example_game_output.png?raw=true)

## Acknowledgments
> [!IMPORTANT]
> Thanks to the creators of the 'colorize' gem for making terminal output more colorful and engaging.

--------------------------------------------------------------------
## Refactoring Process

The original game was refactored to follow Ruby OOP principles, improving code organization and readability. The refactoring process involved the following steps:

1. **Modularization**:
    Moved helper methods to a separate module (lib/colorize_helper.rb).
    Created separate classes for Board (lib/board.rb), Player (lib/player.rb), and Game (lib/game.rb).

2. **Class Implementation**:
    Board Class: Handles all board-related logic such as initializing, displaying, validating moves, and checking win/draw conditions.
    Player Class: Manages player details and interactions.
    Game Class: Orchestrates the overall game flow, including initializing players and board, managing turns, and determining the game's outcome.

3. **Method Refactoring**:
    Methods were refactored to fit within their respective classes, ensuring clear responsibility and separation of concerns.
    Helper methods were created to simplify complex logic and improve code readability.
4. **Error Handling**:
    Improved input validation and error messages for better user experience.
    Ensured the game prompts correctly for replay and handles invalid inputs gracefully.

5. **Code Readability**:
    Added comments and improved method names for better understanding and maintainability.
    Organized code into smaller, manageable methods within their appropriate classes.

