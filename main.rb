module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in self do
      yield(i)
    end
  end
  
end

[2, 3, 4, 5, 6].my_each {|n|
  p n * 2
}