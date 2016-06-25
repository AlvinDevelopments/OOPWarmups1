class TowerOfHanoi

  def initialize(size)
   @disk_count = size

    @winning_stack = Stack.new(size)

    i = size
    @stacks = Array.new(3)
    @stacks[0] = Stack.new(size)
    @stacks[1] = Stack.new(size)
    @stacks[2] = Stack.new(size)

    size.times do
      @stacks[0].stack(i)
      @winning_stack.stack(i)
      i-=1
    end
  end

  def make_move()
   render()
   puts "where do you want to make move?"
     org = gets.chomp
   puts "where do you want to move to?"
     dest = gets.chomp
   @stacks[org.to_i].remove_top() if  @stacks[dest.to_i].stack(@stacks[org.to_i].top)


  end

  def render()
    print @stacks[0].to_s
    puts
    print @stacks[1].to_s
    puts
    print @stacks[2].to_s
    puts
  end

  def check_win?()
    i = 0
    @disk_count.times do
      return false if @stacks[2].value(i) != @winning_stack.value(i)
      i+=1
    end
    return true
  end





end



class Stack

  attr_reader :top
  attr_reader :top_index
  attr_reader :stack

  def initialize(size)
    @stack = Array.new(size, 0)
    @top = 0
    @top_index = -1

  end

  def add_on_top?(new_piece)
    if new_piece < @top
     return true
    elsif @top == 0
      return true
    else
     return false
    end
  end

  def stack(new_piece)
    if add_on_top?(new_piece)
      @stack[@top_index+1] = new_piece
      @top = new_piece
      @top_index = @top_index+1
      return true
    end
  end

  def remove_top()
    if @top != -1
      @stack[@top_index] = 0
      @top_index = @top_index-1
      @top = @stack[@top_index]
    end
  end

  def to_s
   print @stack
  end

  def value(index)
    return @stack[index]
  end

end


new_game = TowerOfHanoi.new(3)
while true
  new_game.make_move
  break if new_game.check_win?
end
new_game.render
puts "you win!!!"
