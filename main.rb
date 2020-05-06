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

  def my_select
    arr = []
    for i in self do
      if yield(i)
        arr.push(i)
      end
    end
    arr
  end

  def my_all?
    for i in self do
      if yield(i)
        return true
      else
        return false
      end
    end
  end
end

p ["ca", "dog", "cow", "bear"].my_all?{ |word| word.length >= 3 }
