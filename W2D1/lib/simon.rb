class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    puts "remember the sequence: "
    sleep(1)
    @seq.each do |color|
      system("clear")
      puts "remember the sequence: #{color}"
      sleep(1)
    end
  end

  def require_sequence
    guessed_colors = []
    @seq.each do |color|
      system("clear")
      puts "enter colors one at a time.  #{guessed_colors.join(" ")}"
      guess = gets.chomp
      if guess[0] != color[0]
        @game_over = true
        break
      else
        guessed_colors << color
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    system("clear")
    puts @seq.join(" ")
    puts 'you made it to the next round'
    sleep(3)
  end

  def game_over_message
    puts "game over. sequence_length: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
