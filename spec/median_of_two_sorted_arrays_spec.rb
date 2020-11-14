require_relative '../examples/median_of_two_sorted_arrays'

describe 'find_median_sorted_arrays' do

  def calculate(first_array, second_array)
    find_median_sorted_arrays(first_array, second_array).to_f
  end

  it 'calculates the median' do
    expect(calculate([1,3], [2])).to eq(2.to_f)
    expect(calculate([1,2], [3,4])).to eq(2.5.to_f)
    expect(calculate([0,0], [0,0])).to eq(0.to_f)
    expect(calculate([], [1])).to eq(1.to_f)
    expect(calculate([2], [])).to eq(2.to_f)
    expect(calculate([3], [-2,-1])).to eq(-1.to_f)
    expect(calculate([1,2], [-1,3])).to eq(1.5.to_f)
  end


end