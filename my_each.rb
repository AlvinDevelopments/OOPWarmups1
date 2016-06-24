class Array

  def my_each
        self.map {|i| yield i}
  end

def my_map
      self.my_each {|i| yield i}
end

def my_select(input_proc)
  self.my_each{|i| puts i if input_proc.call(i)==true  }
end

def my_all?(input_proc)
  self.my_each{|i|
    if input_proc.call(i)==false
      puts false
      return
    end
  }
  puts true
end

end



# [1,2,3].my_each{|i| puts i}
#
# [1,2,5].my_map do |item|
#   item ** 2
# end

# my_proc = Proc.new{|item| item.even?}
# #=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
# [1,2,5,6,7,8,9,10].my_select(my_proc)
# #=> [2]

my_proc = Proc.new{|item| item.even?}
#=> #<Proc:0x007fbb6b9c1ff8@(irb):2>
[1,2,5].my_all?(my_proc)
#=> false
[2,10,20].my_all?(my_proc)
#=> true
