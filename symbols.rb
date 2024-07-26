module Symbols
  # constants
  CELEBRATION_SYMBOL = "\u{1F389}"
  RAINBOW_SYMBOL = "\u{1F308}"
  COOL_EMOJI = "\u{1F60E}"
  MUSHROOM_EMOJI = "\u{1F344}"
  AIM_SYMBOL = "\u{1F3AF}"

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6]             # Diagonals
  ]
end
