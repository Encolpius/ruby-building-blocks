module Enumerable

  def my_each
    (self.length).times { |item| yield(self[item]) }
  end

  def my_each_with_index
    (self.length).times { |index| yield(self[index], index)}
  end

  def my_select
    return self.to_enum if !block_given?
      my_selection = []
      self.my_each { |item| my_selection << item if yield(item) }
      my_selection
  end

  def my_all?
    unless block_given?
      self.my_each { |item| return false if item == false || item == nil}
      return true
    end
    my_all_selection = []
    self.my_each do |item|
      my_all_selection << item if yield(item)
    end
    my_all_selection.length == self.length ? true : false
  end

  def my_any?
    unless block_given?
      self.my_each { |item| return true if item }
      return false
    end
    my_any_selection = []
    self.my_each do |item|
      my_any_selection << item if yield(item)
      return true if my_any_selection.size > 0
    end
    false
  end

  def my_none?
    unless block_given?
      self.my_each { |item| return false if item }
      return true
    end
    my_none_selection = []
    self.my_each do |item|
      my_none_selection << item if yield(item)
    end
    return true if my_none_selection.size == 0
    false
  end

  def my_count(&block)
    count = 0
    if !(block_given?)
      count = self.length
      return count
    end
    count = self.my_select(&block).length
  end

  def my_map(&proc)
    return self.to_enum unless block_given?
    my_mapped = []
    self.my_each do |item|
      my_mapped << yield(item)
    end
    my_mapped
  end

  def my_inject(*arguments)
    array = self.to_a
    if arguments.length > 0 && arguments[0].class != Symbol
      accumulator = arguments[0]
      array.my_each { |item| accumulator = yield(accumulator, item) }
    elsif arguments.length == 0
      accumulator = self.to_a[0]
      array[1..-1].my_each { |item| accumulator = yield(accumulator, item) }
    elsif arguments[0].class == Symbol
      accumulator = self.to_a[0]
      operation = arguments[0]
      array[1..-1].my_each { |item| accumulator = accumulator.send(operation, item) }
    end
    accumulator
  end

  def multiply_els(arr)
    arr.my_inject { |a, b| a * b}
  end

end

include Enumerable

=begin

my_arr = [ "puppies", 4, 2, 1, 3, "food", 12 ]
my_other_arr = [nil, nil, false]
my_numbers = [1, 2, 3, 4, 5]
test_test_test_proc = Proc.new { |i| i * i }

=end
