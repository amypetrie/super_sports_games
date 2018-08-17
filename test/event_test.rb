require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/event'

class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("Gymnastics", [32, 22, 24, 26])
    assert_instance_of Event, event
  end

  def test_max_age
    event = Event.new("Gymnastics", [32, 22, 24, 26])
    expected = [32, 22, 24, 26].max
    assert_equal expected, event.max_age
  end

  def test_min_age
    event = Event.new("Gymnastics", [32, 22, 24, 26])
    expected = [32, 22, 24, 26].min
    assert_equal expected, event.min_age
  end

  def test_average
    event = Event.new("Gymnastics", [32, 22, 24, 26, 432432])
    nums = [32, 22, 24, 26, 432432]
    sum = nums.sum
    count = nums.count
    expected = sum.to_f / count.to_f
    assert_equal expected, event.average(nums)
  end

  def test_average_age
    event = Event.new("Gymnastics", [22, 24, 26, 15, 12, 17, 14, 43])
    ages = [22, 24, 26, 15, 12, 17, 14, 43]
    sum = ages.sum
    count = ages.count
    avg = sum.to_f / count.to_f
    expected = avg.to_f.round(2)
    assert_equal expected, event.average_age
  end

  def test_values_sub_avg
    event = Event.new("Gymnastics", [10, 43, 32, 31])
    avg = 2
    values = [10, 43, 32, 31]
    expected = [10 - avg.round(2), 43 - avg, 32 - avg, 31 - avg]
    assert_equal expected, event.values_sub_avg(avg, values)
  end

  def test_values_squared
    event = Event.new("Gymnastics", [32, 22, 24, 26])
    assert_equal [32**2, 22**2, 24**2, 26**2], event.values_squared([32, 22, 24, 26])
  end

  def test_print_standard_deviation
    event = Event.new("Gymnastics", [24, 30, 18, 20, 41])
    ages = [24, 30, 18, 20, 41]
    input = 24 + 30 + 18 + 20 + 41
    count = ages.count
    avg = input.to_f / count.to_f
    new_array_1 = [24 - avg.round(2), 30 - avg.round(2), 18 - avg.round(2), 20 - avg.round(2), 41 - avg.round(2)]
    new_array_2 = new_array_1.map do |lesser_age|
      new_value = lesser_age**2
      new_value.round(2)
    end
    pre_final_value = new_array_2.sum / count.round(2)
    expected = Math.sqrt(pre_final_value).round(2)
    assert_equal expected, event.print_standard_deviation(ages)
  end

  def test_standard_deviation_age
    event = Event.new("Gymnastics", [24, 30, 18, 20, 41])
    ages = [24, 30, 18, 20, 41]
    input = 24 + 30 + 18 + 20 + 41
    count = ages.count
    avg = input.to_f / count.to_f
    new_array_1 = [24 - avg.round(2), 30 - avg.round(2), 18 - avg.round(2), 20 - avg.round(2), 41 - avg.round(2)]
    new_array_2 = new_array_1.map do |lesser_age|
      new_value = lesser_age**2
      new_value.round(2)
    end
    pre_final_value = new_array_2.sum / count.round(2)
    final = Math.sqrt(pre_final_value).round(2)
    expected = final.to_f.round(2)
    assert_equal expected, event.standard_deviation_age
  end
end
