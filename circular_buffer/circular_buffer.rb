class CircularBuffer
  attr_reader :buffer_size, :buffer

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @buffer = []
  end

  def write(value)
    return if value.nil?
    raise BufferFullException if full?
    buffer << value
  end

  def write!(value)
    return if value.nil?
    read if full?
    write(value)
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def clear
    buffer.clear
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  private

  attr_reader :buffer_size, :buffer

  def full?
    buffer.size == buffer_size
  end
end
