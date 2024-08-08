require_relative 'node'
require 'pry-byebug'

class LinkedList 
  attr_accessor :head, :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  def append(value)
    # if list is not initialized yet, then create the head node
    return prepend(value) if self.head == nil

    # if head is created, loop to the last node and append to the last node
    tmp = self.head
    while (tmp.next_node != nil)
      tmp = tmp.next_node
    end
    # add new node
    self.tail = Node.new(value)
    tmp.next_node = self.tail
  end

  def prepend(value)
    new_head = Node.new(value, self.head)  
    self.head = new_head
  end

  def size
    count = 0
    self.for_each { count += 1 }
    return count
  end

  private

  def for_each
    tmp = self.head

    while (tmp != nil)
      yield(tmp)
      tmp = tmp.next_node
    end
  end

end

list = LinkedList.new

# p list
list.append('dog')
list.prepend('cat')
# p list.inspect

list.append('parrot')
puts list.size
puts list.head.value
puts list.tail.value
# list.append('hamster')
# list.append('snake')
# list.append('turtle')