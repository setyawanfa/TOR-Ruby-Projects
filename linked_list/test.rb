# frozen_string_literal: true

require_relative 'linked_list'

list = LinkedList.new

p list.size
p list.to_s
array = 1..20
array.each { |item| list.append(item) }
p list.head.value
p list.size

p list.to_s
# p list.tail
list.prepend(30)
p list.size
p list.at(10).value

p list.find(30)
p list.find(19)
p list.find(100)

p list.contains?(30)
p list.contains?(20)
p list.contains?(100)

p list.size
p list.pop
p list.size
