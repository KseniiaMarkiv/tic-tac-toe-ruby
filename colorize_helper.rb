require 'colorize'
# * colorizing methods

module ColorizeHelper

  def self.blue_color(string)
    string.colorize(:blue)
  end

  def self.yellow_color(string)
    string.colorize(:yellow)
  end

  def self.green_color(string)
    string.colorize(:green)
  end

  def self.red_color(string)
    string.colorize(:red)
  end

  def self.gray_color(string)
    string.colorize(:gray)
  end

end