class Player

  def initialize(name)
    @name = name
  end

  def make_move()
    puts "Choose from the following options:"
    puts "1. Rock"
    puts "2. Paper"
    puts "3. Scissors"
    self.set_move(gets.chomp)
  end

  def set_move(move)
    @move = move.to_i
  end

  def name()
    @name
  end

  def move()
    @move
  end
end

class Game

  def compute_winner
    if @p_one.move == 1

      if @p_two.move == 2
        puts "#{@p_two.name} wins!!"
      elsif @p_two.move == 3
        puts "#{@p_one.name} wins!!"
      else
        puts "It's a tie."
      end

    elsif @p_one.move == 2

        if @p_two.move == 1
          puts "#{@p_one.name} wins!!"
        elsif @p_two.move == 3
          puts "#{@p_two.name} wins!!"
        else
          puts "It's a tie."
        end

    elsif @p_one.move == 3

          if @p_two.move == 1
            puts "#{@p_two.name} wins!!"
          elsif @p_two.move == 2
            puts "#{@p_one.name} wins!!"
          else
            puts "It's a tie."
          end
    end
  end


  def initialize(player_one)
    @p_one = Player.new(player_one)
    @p_two = Player.new("CPU")
    @mode = 1
  end

  def initialize(player_one, player_two)
    @p_one = Player.new(player_one)
    @p_two = Player.new(player_two)
    @mode = 2
  end

  def start_game()
    if @mode == 1
      while 1 do
        puts "Type Q to quit, or A to play SINGLE PLAYER"
        choice = gets.chomp
        if choice == "Q"
          break
        end
        print "#{@p_one.name()}, "
        @p_one.make_move()
        @p_two.set_move(rand(1..3))
        self.compute_winner()
      end
    elsif @mode == 2
      while 1 do
        puts "Type Q to quit, or A to play TWO PLAYER"
        choice = gets.chomp
        if choice == "Q"
          break
        end
        print "#{@p_one.name()}, "
        @p_one.make_move()
        print "#{@p_two.name()}, "
        @p_two.make_move()
        self.compute_winner()
      end
    end
  end

end


new_game = Game.new("Alvin", "Noob")
new_game.start_game()
