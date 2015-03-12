class Robot

  # the boundary should be able to scale but not fixed
  @x
  @y
  @f

  def initialize(x = nil, y = nil, f = nil)
    @x = x
    @y = y
    @f = f
  end

  # get the command from user and execute it if it is valid
  def receiveCommand(command)
    # match the 'PLACE' command
    match = /^PLACE ([0-4]),([0-4]),(NORTH|EAST|SOUTH|WEST)/.match(command)
    if match
      self.set(match[1].to_i, match[2].to_i, match[3])
    elsif command == 'MOVE'
      self.move
    elsif command == 'LEFT'
      self.turnLeft
    elsif command == 'RIGHT'
      self.turnRight
    elsif command == 'REPORT'
      puts self.report
    end
  end

  # respond to the "PLACE" command and set to the specified position and orientation
  def set(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  # move forward based on the current orientation
  def move
    if @f == 'NORTH'
      @y += 1
    elsif @f == 'EAST'
      @x += 1
    elsif @f == 'SOUTH'
      @y -= 1
    elsif @f == 'WEST'
      @x -= 1
    end
  end

  # turn left based on the current orientation
  def turnLeft
    if @f == 'NORTH'
      @f = 'WEST'
    elsif @f == 'EAST'
      @f = 'NORTH'
    elsif @f == 'SOUTH'
      @f = 'EAST'
    elsif @f == 'WEST'
      @f = 'SOUTH'
    end
  end

  # turn right based on the current orientation
  def turnRight
    if @f == 'NORTH'
      @f = 'EAST'
    elsif @f == 'EAST'
      @f = 'SOUTH'
    elsif @f == 'SOUTH'
      @f = 'WEST'
    elsif @f == 'WEST'
      @f = 'NORTH'
    end
  end

  def report()
    return @x.to_s + ',' + @y.to_s + ',' + @f
  end

end
