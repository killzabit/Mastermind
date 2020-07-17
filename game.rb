




class Game
attr_accessor :cpu, :code, :player, :code_pool, :human_code_maker

CODE_POOL = %w[r p y b g o]

  def initialize
    @cpu = Cpu.new
    @code = []
    @player = Player.new
    @human_code_maker = false
  end

  def game_start
    puts 'Hi, play the game.'
    human_code_maker?
    @cpu.code_generator code, CODE_POOL
    puts "#{code} This is the code, delete this puts after testing"
    puts "#{human_code_maker}"

  end

  def human_code_maker_loop

  end

  def human_code_breaker_loop
    @cpu.code_generator code, CODE_POOL
    i = 0
    while i < 13
      @player.guess


  end

  private

  def code_maker_ask
    puts 'Enter yes if you want to be the code maker: '
    gets.chomp.downcase
  end

  def human_code_maker?
    @human_code_maker = true if code_maker_ask == 'yes'
  end
  
end
