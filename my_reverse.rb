def my_reverse(string)

  string_array = string.split(//)

  i = string_array.size-1
  j = 0

  new_str = Array.new(i)

  (string_array.size).times do

    new_str[j] = string_array[i]
    j+=1
    i-=1

  end


  puts new_str.join("")


end

my_reverse("haha")
