require_relative 'node'

class LinkedList 
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    # if list is not initialized yet, then create the head node
    return prepend(value) if self.head == nil

    # if head is created, loop to the last node and append to the last node
    tmp = self.head
    while (tmp.next_node != nil)
      tmp.next_node
    end
    # assign last_node.next = Node.new(value)
    tmp.next_node = Node.new(value)
  end

  def prepend(value)
    new_head = Node.new(value, self.head)  
    self.head = new_head
  end

end

list = LinkedList.new
# p list
list.append('dog')

list.prepend('cat')
p list.inspect
# list.append('parrot')
# list.append('hamster')
# list.append('snake')
# list.append('turtle')