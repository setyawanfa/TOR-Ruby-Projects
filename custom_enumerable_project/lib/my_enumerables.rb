# frozen_literal_string : true 
module Enumerable
  # Your code goes here
  def my_each_with_index
    return :enumerable unless block_given?
    i = 0
    self.my_each do |x|
      yield x, i
      i = i+1
    end
    self
  end
  
  def my_select(&block)
    return :enumerable unless block_given?
    result = []
    self.my_each do |x|
      result << x if block.call(x) ==true
    end
    result
  end

  def my_count(&block)
    return self.length unless block_given?
    result = self.my_select(&block)
    result.length
  end

  def my_all?(&block)
    return true unless block_given?
    result = self.my_select(&block)
    if result.length == self.length 
      return true
    else 
      return false
    end
  end

  def my_any?(&block)
    return true unless block_given?
    result = self.my_select(&block)
    if result.length>0
      return true
    else
      return false
    end
  end
  
  def my_none?(&block)
    return true unless block_given?
    result = self.my_select(&block)
    if result.length>0 
      return false
    else 
      return true
    end
  end

  def my_map(&block)
    return :enumerable unless block_given?
    result = []
    self.my_each do |x|
      result << block.call(x)
    end
    result
  end

  def my_inject(initial_value)
    result = initial_value
    self.my_each do |x|
      result = yield result, x
    end
    result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return :enumerable unless block_given?

    for key,value in self do
      yield key, value
    end
  end
end
