class Robot

  # the boundary should be able to scale but not fixed
  attr_reader :x
  attr_reader :y
  attr_reader :f

  def initialize(x = nil, y = nil, f = nil)
    @x = x
    @y = y
    @f = f
  end

  # check the robot if it is on the table or initialized
  def isOnTable
    return !@x.nil? && !@y.nil? && !@f.nil?
  end

  # get the command from user
  # execute it if it is valid and return true
  # ignore it if it is invalid and return false
  def receiveCommand(command)
    # match the 'PLACE' command
    match = /^PLACE ([0-4]),([0-4]),(NORTH|EAST|SOUTH|WEST)$/.match(command)
    if match
      self.set(match[1].to_i, match[2].to_i, match[3])
      return true
    elsif self.isOnTable
      # only execute these commands after the robot has been on the table
      if command == 'MOVE'
        self.move
      elsif command == 'LEFT'
        self.turnLeft
      elsif command == 'RIGHT'
        self.turnRight
      elsif command == 'REPORT'
        self.report
      else
        # if it receives an invalid PLACE command
        return false
      end
      return true
    else
      return false
    end
  end

  # respond to the "PLACE" command and set to the specified position and facing
  def set(x, y, f)
    @x = x
    @y = y
    @f = f
    self
  end

  # move one unit forward based on the current facing
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
    self
  end

  # turn left based on the current facing
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
    self
  end

  # turn right based on the current facing
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
    self
  end

  # return the string representing the object
  # also used by test cases to verify the result of any action
  def getStr
    if self.isOnTable
      return @x.to_s + ',' + @y.to_s + ',' + @f
    else
      return 'Robot is not on the table'
    end
  end

  # report the current position and facing by printing them as string to the console
  def report
    puts self.getStr
    self
  end

end
