def fibs(number)

  first = 0
  second = 1

  fibs_array = []

  if number == 1
    fibs_array << first
    print fibs_array
  elsif number == 2
    fibs_array << first << second
    print fibs_array
  elsif number > 2
    fibs_array << first << second
    number.times do
      first = first + second
      second = first + second
      fibs_array << first << second
    end
    print fibs_array
  end


end

fibs(20)
