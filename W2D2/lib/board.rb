class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @p1, @p2 = name1, name2

    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    (0..5).to_a.concat((7..12).to_a).each do |i|
      cups[i] = [:stone, :stone, :stone, :stone]
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0,6) || start_pos.between?(7,12)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    skip_idx = current_player_name == @p1 ? 13 : 6
    cup_idx = current_player_name == @p1 ? 6 : 13
    to_place = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    until to_place.empty?
      i = (i + 1) % 14
      next if i == skip_idx
      @cups[i] << to_place.pop
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    @cups[ending_cup_idx].length == 1 ? :switch : ending_cup_idx
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    case cups[6] <=> cups[13]
    when 1
      @p1
    when -1
      @p2
    when 0
      :draw
    end
  end
end
