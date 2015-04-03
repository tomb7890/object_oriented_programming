class Rover
  def initialize(x,y,direction)
    @x = x 
    @y = y
    @direction = direction
  end

  def handle_instruction(i)
    if i == 'M' then
      move
    else
      turn(i)
    end
  end

  def read_instruction(i)
    i = gets.chomp
    handle_instruction(i)
  end

  def command(string)
    string.each_char  do |ch|
      handle_instruction(ch)
    end
    "#{@x} #{@y} #{@direction}"
  end

  def set_plateau_size(x,y)
    @plateau_size = x,y
  end

  def move
    case @direction 
    when "N" 
      @y += 1 
    when "S"
      @y -= 1 
    when "W" 
      @x -= 1
    when "E" 
      @x += 1 
    end
  end
  
  def turn(dir)
    case dir
    when "L" 
      turn_left
    when "R"
      turn_right
    end
  end

  def turn_left
    case @direction 
    when "N" 
      @direction = "W"
    when "S"
      @direction = "E"
    when "W" 
      @direction = "S"
    when "E" 
      @direction = "N"
    end
  end

  def turn_right
    case @direction 
    when "N" 
      @direction = "E"
    when "S"
      @direction = "W"
    when "W" 
      @direction = "N"
    when "E" 
      @direction = "S"
    end
  end
end




