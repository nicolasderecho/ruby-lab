def reverse(array)
  cloned_array = array.dup
  reversed_array = []
  array.length.times { reversed_array.push(cloned_array.pop) }
  reversed_array
end