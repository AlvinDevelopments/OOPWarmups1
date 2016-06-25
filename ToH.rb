class TowerOfHanoi

  def initialize(size)
    @move_count = 0
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
   dest = 0
   org = 0
   while true
     puts "What column would you like to move from?"
     org = gets.chomp

     if org.to_i >= 3 || org.to_i < 0
       puts "Invalid column index, please try again."
     else
       break
     end
    end

    while true
      puts "What column would you like to move to?"
      dest = gets.chomp

      if dest.to_i >= 3 || dest.to_i < 0
        puts "Invalid column index, please try again."
      elsif dest == org
        puts "Cannot place disk into its current column, please try again."
      else
        break
      end
     end

   if  @stacks[dest.to_i].stack(@stacks[org.to_i].top)
     @stacks[org.to_i].remove_top()
     @move_count+=1
   end
  end

  def render()
    puts "MOVES: #{@move_count}"
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


  def start_game()
    while true
      make_move
      break if check_win?
    end
    render
    puts "You won with #{@move_count} moves!"
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
     puts "Invalid move, please try again."
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
new_game.start_game()
