# frozen_string_literal: true

# Stores player guess and handles error with player guess.
class Player
  attr_accessor :current_guess

  def initialize
    @current_guess
  end

  def guess
    puts
    puts "Try to guess the secret code! \n "
    @current_guess = gets.chomp.downcase
    check_guess_error
  end

  private

  def check_guess_error
    handle_guess_error if current_guess.length < 4
    handle_guess_error if current_guess.length > 4
  end

  def handle_guess_error
    puts "Your guess needs to be 4 characters long, try again \n "
    guess
  end
end
