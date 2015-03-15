class Robot

  attr_reader :x
  attr_reader :y
  attr_reader :f

  def initialize(x = nil, y = nil, f = nil, minx = 0, maxx = 4, miny = 0, maxy = 4)
    # do not restrict the value of x, y, f in order to inject failure
    @x = x
    @y = y
    @f = f
    # the min value for x
    @minx = minx
    # the max value for x
    @maxx = maxx
    # the min value for y
    @miny = miny
    # the max value for y
    @maxy = maxy
    @facings = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  end

  # check the robot if it is initialized
  def isInitialized
    return !@x.nil? && !@y.nil? && !@f.nil?
  end

  # check the robot if it is on the table
  def isOnTable
    return self.isInitialized && (@minx..@maxx).include?(@x) && (@miny..@maxy).include?(@y)
  end

  # check the arguments if they are valid
  # these arguments should not make the robot falling from table
  def checkArguments(x, y, f)
    return (@minx..@maxx).include?(x) && (@miny..@maxy).include?(y) && @facings.include?(f)
  end

  # get the command from user
  # route to the method if it is a valid command and return true
  # ignore it if it is invalid command and return false
  # only validate the command name and format but not the internal state of robot
  def receiveCommand(command)
    # match the 'PLACE' command
    match = /^PLACE ([0-4]),([0-4]),(NORTH|EAST|SOUTH|WEST)$/.match(command)
    if match
      self.set(match[1].to_i, match[2].to_i, match[3])
    elsif command == 'MOVE'
      self.move
    elsif command == 'LEFT'
      self.turnLeft
    elsif command == 'RIGHT'
      self.turnRight
    elsif command == 'REPORT'
      self.report
    else
      # if it receives an invalid command
      return false
    end
    return true
  end

  # respond to the "PLACE" command and set to the specified position and facing
  def set(x, y, f)
    if self.checkArguments(x, y, f) == true
      @x = x
      @y = y
      @f = f
    end
    self
  end

  # move one unit forward based on the current facing
  def move
    if self.isOnTable
      if @f == 'NORTH'
        if @maxy - @y > 0
          @y += 1
        end
      elsif @f == 'EAST'
        if @maxx - @x > 0
          @x += 1
        end
      elsif @f == 'SOUTH'
        if @y > 0
          @y -= 1
        end
      elsif @f == 'WEST'
        if @x > 0
          @x -= 1
        end
      end
    end
    self
  end

  # turn left based on the current facing
  def turnLeft
    if self.isOnTable
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
    self
  end

  # turn right based on the current facing
  def turnRight
    if self.isOnTable
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
    self
  end

  # return the string representing the object
  # also used by test cases to verify the result of any action
  def getStr
    if self.isInitialized
      if self.isOnTable
        return @x.to_s + ',' + @y.to_s + ',' + @f
      else
        return 'Robot has fallen from the table'
      end
    else
      return 'Robot has not been on the table'
    end
  end

  # report the current position and facing by printing them as string to the console
  def report
    if self.isOnTable
      puts self.getStr
    end
    self
  end

end
