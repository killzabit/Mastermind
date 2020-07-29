# frozen_string_literal: true

# Starts the whole universe.
require './cpu.rb'
require './game.rb'
require './player.rb'
require './guess_check.rb'

g = Game.new

g.game_start
