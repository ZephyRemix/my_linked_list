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

  def at(index)
    i = 0
    self.for_each do |node|
      return node if i == index
      i += 1
    end
  end
  
  def pop

    prev = Node.new
    curr = self.head

    while !curr.next_node.nil?
      prev = curr
      curr = curr.next_node
    end

    prev.next_node = nil
    self.tail = prev
    curr.value
  end

  def contains?(value)
    contains_value = false

    self.for_each do |node|
      contains_value = (node.value == value)

      if contains_value == true
        return contains_value
      end
    end
    contains_value
  end

  def find(value)
    i = 0
    self.for_each do |node| 
      return i if value == node.value
      i += 1
      end
  end

  def to_s
    self.for_each {|node| print "( #{node.value} ) -> "}  
    puts "nil"
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

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list