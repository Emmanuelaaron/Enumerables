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
     if !yield(i)
      return false 
     end
    end
    true
  end

  def my_any?
    return false if self.length == 0 
    for i in self do
      if yield(i)
        return true
      else
        return false
      end
    end
  end

  def my_none?
    for i in self do
      return false if yield(i)
    end
    true
  end

  def my_count
    self.length
  end

  def my_map
    my_arr = []
    for i in self do
      if yield(i)
        my_arr.push(i)
      end
    end
    my_arr
  end
end

p (1...4).map { |i| i*i }  