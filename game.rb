# frozen_string_literal: true

require './guess_check.rb'

# Runs the game and stores the needed vars
class Game
  attr_accessor :cpu, :code, :player, :code_pool, :human_code_maker,
                :feedback_array

  CODE_POOL = %w[r p y b g o]

  include GuessCheck

  def initialize
    @cpu = Cpu.new
    @code = []
    @player = Player.new
    @human_code_maker = false
    @feedback_array = []
  end

  def game_start
    puts "Hi, play the game. \n "
    puts "The code pool is #{CODE_POOL} \n "
    human_code_maker? ? human_code_maker_loop : human_code_breaker_loop
  end

  def human_code_maker_loop
    human_make_code
    i = 1
    while i < 13
      puts "Try # #{i}"
      sleep 1
      @cpu.generate_guess CODE_POOL
      puts "Cpu guessed: #{@cpu.cpu_guess} \n "
      break if cpu_win?
      @cpu.better_dang_guess_now_son
      i += 1
    end
    if i == 13
      loser
    else
      win_message
    end
  end

  def human_code_breaker_loop
    @cpu.code_generator code, CODE_POOL
    i = 1
    while i < 13
      puts "#{code} This is the code, delete this puts after testing \n "
      @player.guess
      @feedback_array = @code.map(&:clone)
      give_feedback
      break if winner?
      reset_feedback
      i += 1
    end
    if i == 13
      loser
    else
      win_message
    end
  end

  private

  def code_maker_ask
    puts 'Enter yes if you want to be the code maker: '
    gets.chomp.downcase
  end

  def human_code_maker?
    @human_code_maker = true if code_maker_ask == 'yes'
  end

  def human_make_code
    puts 'Please choose the code, it must be 4 chars: '
    @code = gets.chomp.downcase
    if @code.length != 4
      human_make_code
    end
  end

  def loser
    puts 'You won in an alt reality'
  end

  def win_message
    puts "The code is broken! \n "
  end

  def winner?
    feedback_array.all?(/red/) && feedback_array.length == 4
  end

  def cpu_win?
    @cpu.cpu_guess == @code
  end
end
