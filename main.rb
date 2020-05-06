# rubocop: disable Style/For, Style/GuardClause
# rubocop: disable Style/RedundantSelf, Style/RedundantReturn
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
    len = self.length
    until i == len
      yield(my_arr[i], i)
      i += 1
    end
    self
  end

  def my_select
    arr = []
    for i in self do
      arr.push(i) if yield(i)
    end
    arr
  end

  def my_all?
    for i in self do
      return false unless yield(i)
    end
    true
  end

  def my_any?
    return false if self.length.zero?

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
    return self.length
  end

  def my_map
    my_arr = []
    for i in self do
      my_arr.push(i) if yield(i)
    end
    my_arr
  end

  def my_inject
    "h"
  end
end

# rubocop: enable Style/For, Style/GuardClause
# rubocop: enable Style/RedundantSelf, Style/RedundantReturn
