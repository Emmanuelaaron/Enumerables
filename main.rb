module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in self do
      yield(i)
    end
  end

  def my_each_with_index
    i = 0
    my_arr = to_a
    until i == self.length
      yield(my_arr[i], i)
      i += 1
    end
    self
  end
end

[2, 3, 4, 5, 6].my_each_with_index {|value, index|
  puts "value: #{value}, index: #{index}"
}