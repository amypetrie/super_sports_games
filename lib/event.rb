require 'pry'

class Event

  attr_reader :name, :ages

  def initialize(name, ages)
    @name = name
    @ages = ages
  end

  def print_standard_deviation(ages)
    ages = self.ages
    avg = average(ages)
    lesser_array = values_sub_avg(avg, ages)
    squared_array = values_squared(lesser_array)
    pre_final_value = squared_array.sum / ages.count
    standard_deviation = Math.sqrt(pre_final_value).round(2)
    p standard_deviation
  end

  def average(numeric_values)
    sum = numeric_values.sum
    count = numeric_values.count
    avg = sum.to_f / count.to_f
  end

  def values_sub_avg(avg, numeric_values)
    lesser_array = []
    numeric_values.each do |num|
    lesser_num = num - avg
    lesser_num = lesser_num.round(2)
    lesser_array << lesser_num
  end
    lesser_array
  end

  def values_squared(new_array)
    squared_array = []
    new_array.each do |num|
    num_squared = num ** 2
    num_squared = num_squared.round(2)
    squared_array << num_squared
  end
      squared_array
  end

  def max_age
    p ages.max.to_i
  end

  def min_age
    p ages.min.to_i
  end

  def average_age
    p average(ages).to_f.round(2)
  end

  def standard_deviation_age
    print_standard_deviation(ages).to_f.round(2)
  end
end

ages = [24, 30, 18, 20, 41]
event1 = Event.new("Ice Skating", ages)
event1.print_standard_deviation(ages)
event1.max_age
event1.min_age
event1.average_age
event1.standard_deviation_age
