class Robot

  @x
  @y
  @f

  # respond to "PLACE" command
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
