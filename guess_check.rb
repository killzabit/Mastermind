# frozen_string_literal: true

# Gives feedback and checks the guesses, resets and trims.
module GuessCheck
  def give_feedback
    puts
    create_feedback
    trim_feedback
    if @feedback_array.length.positive?
      puts "Feedback: #{feedback_array} \n "
    else
      puts "You did a bad job and missed them all. \n "
    end
  end

  def create_feedback
    @feedback_array.each_with_index do |el, index|
      if @code[index] == @player.current_guess[index]
        el.replace 'red'
      elsif @feedback_array.include?(@player.current_guess[index])
        i = @feedback_array.index(@player.current_guess[index])
        @feedback_array[i] = 'white' if el != 'red'
      end
    end
  end

  def trim_feedback
    @feedback_array.filter! { |item| item == 'red' || item == 'white' }
  end

  def reset_feedback
    @feedback_array.clear
  end
end
