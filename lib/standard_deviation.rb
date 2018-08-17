def print_standard_deviation(numeric_values)
  values = numeric_values
  avg = average(values)
  lesser_array = values_sub_avg(avg, values)
  squared_array = values_squared(lesser_array)
  pre_final_value = squared_array.sum / values.count
  standard_deviation = Math.sqrt(pre_final_value).round(2)
  p "The standard deviation of #{numeric_values.join(", ")} is #{standard_deviation}."
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

ages = [24, 30, 18, 20, 41]
print_standard_deviation(ages)
