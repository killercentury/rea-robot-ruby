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

  def turnLeft()
    #
  end

  def turnRight()
    #
  end

  def report()
    return @x.to_s + ',' + @y.to_s + ',' + @f
  end

end
