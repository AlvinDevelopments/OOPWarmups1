def my_benchmark(number_of_times)

  start = Time.now

  number_of_times.times do
    puts "hi"
  end

  finish = Time.now

  puts (finish - start)


end


my_benchmark(1)
