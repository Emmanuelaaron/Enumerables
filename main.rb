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
    return to_enum(:my_each_with_index) unless block_given?

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
    return to_enum(:my_select) unless block_given?

    arr = []
    for i in self do
      arr.push(i) if yield(i)
    end
    arr
  end

  def my_all?(par1=nil)
    if par1
      for i in 0...length do
        return false unless par1 === self[i]
      end
    elsif block_given?
      for i in self do
        return false unless yield(i)
      end  
    else
      for i in self do
        return false if i.nil? || i === false
      end
    end
    true
  end

  def my_any?(par1=nil)
    if par1
      for i in 0...length do
        return true if par1 === self[i]
      end
    elsif block_given?
      for i in self do
        return true if yield(i)
      end  
    else
      for i in self do
        return true if i
      end
    end
    false
  end

  def my_none?(par1=nil)
    if par1
      for i in 0...length do
        return false if par1 === self[i]
      end
    elsif block_given?
      for i in self do
        return false if yield(i)
      end  
    else
      for i in self do
        return false if i
      end
    end
    true
  end

  def my_count(par1=nil)
    count = 0
    if par1
      for i in self do
        if par1 == i
          count += 1
        end
      end
    elsif block_given?
      my_each {|x| count += 1 if yield(x)}

    else
      count = self.length
    end
    count
  end

  def my_map(proc=nil)
    my_arr = []
    if block_given?
      for i in self do
        my_arr.push(yield(i)) if yield(i)
      end
    elsif proc
      for i in self do
        my_arr.push(proc.call(i))
      end
    end
    my_arr
  end

  def my_inject
    for i in self do
      
    end
  end
end

# rubocop: enable Style/For, Style/GuardClause
# rubocop: enable Style/RedundantSelf, Style/RedundantReturn
p (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
p (1..4).my_map { "cat"  }