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

  def move()
    #
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
