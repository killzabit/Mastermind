


class Cpu
  def initialize

  end

  def code_generator(code, code_pool)
    4.times { |_| code.push(code_pool[(rand(0...6))]) }
  end
end