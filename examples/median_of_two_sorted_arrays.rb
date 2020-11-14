def merge_sorted_arrays(first_array, second_array)
  merged_array = []

  loop do
    first_array_value = first_array.shift
    second_array_value = second_array.shift
    break if first_array_value.nil? && second_array_value.nil?
    merged_array.push(first_array_value) and next if second_array_value.nil?
    merged_array.push(second_array_value) and next if first_array_value.nil?

    while !first_array_value.nil? && !second_array_value.nil?
      if(first_array_value <= second_array_value)

        while (!first_array_value.nil?) && first_array_value <= second_array_value do
          merged_array.push(first_array_value)
          first_array_value = first_array.shift
        end
      else
        while (!second_array_value.nil?) && first_array_value > second_array_value do
          merged_array.push(second_array_value)
          second_array_value = second_array.shift
        end
      end
    end

    merged_array.push(first_array_value) and next if second_array_value.nil?
    merged_array.push(second_array_value) and next if first_array_value.nil?

    first_array_value < second_array_value ? merged_array.push(first_array_value, second_array_value) : merged_array.push(second_array_value, first_array_value)

  end
  merged_array
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  max_length = [nums1.length, nums2.length].max
  merged_array = merge_sorted_arrays(nums1, nums2)
  puts merged_array.to_s
  number_of_elements = merged_array.length

  if number_of_elements.even?
    middle_index = (number_of_elements / 2) - 1
    (merged_array[middle_index] + merged_array[middle_index + 1]) / 2.0
  else
    median_index = (number_of_elements / 2.0).round - 1
    merged_array[median_index]
  end

end