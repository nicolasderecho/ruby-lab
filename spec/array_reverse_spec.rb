require_relative '../examples/array_reverse'

describe 'Array Reverse' do

  it 'success' do
    expect(reverse([10,20,33,99,45])).to eq([10,20,33,99,45].reverse)
  end
end