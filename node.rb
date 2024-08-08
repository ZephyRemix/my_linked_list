class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    self.value = value
    self.next = next_node
  end
end 