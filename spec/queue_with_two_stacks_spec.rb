require_relative '../examples/queue_with_two_stacks'

describe 'queue' do

  let(:queue) { Queue.new }

  it 'behaves as a queue' do
    queue.enqueue(10)
    queue.enqueue(5)
    queue.enqueue(27)
    queue.enqueue(26)
    expect(queue.dequeue).to eq(10)
    expect(queue.dequeue).to eq(5)
    expect(queue.dequeue).to eq(27)
    expect(queue.dequeue).to eq(26)
  end

  it 'supports adding more elements after some dequeues' do
    queue.enqueue(10)
    queue.enqueue(5)
    expect(queue.dequeue).to eq(10)
    queue.enqueue(27)
    expect(queue.dequeue).to eq(5)
    queue.enqueue(26)
    expect(queue.dequeue).to eq(27)
    expect(queue.dequeue).to eq(26)
  end

end