# frozen_string_literal: true

# Creates and stores cpu guesses, creates cpu code.
class Cpu
  attr_accessor :cpu_guess

  def initialize
    @cpu_guess = []
  end

  def code_generator(code, code_pool)
    4.times { |_| code.push(code_pool[(rand(0...6))]) }
  end

  def generate_guess(code_pool)
    4.times { |_| @cpu_guess.push(code_pool[(rand(0...6))]) }
  end

  def reset_cpu_guess
    @cpu_guess.clear
  end
end
