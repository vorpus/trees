require_relative 'bst'

class AVLTreeNode < BinaryTreeNode

  def initialize(value)
    @height = 0
    super
  end

end

if __FILE__ == $PROGRAM_NAME
  n1 = BinaryTreeNode.new(5)
  n1.insert(BinaryTreeNode.new(2))
  n1.insert(BinaryTreeNode.new(18))
  n1.insert(BinaryTreeNode.new(-4))
  n1.insert(BinaryTreeNode.new(3))
  n1.insert(BinaryTreeNode.new(20))
  n1.insert(BinaryTreeNode.new(22))
  n1.insert(BinaryTreeNode.new(16))
  n1.insert(BinaryTreeNode.new(14))
  n1.insert(BinaryTreeNode.new(-5))
  n1.insert(BinaryTreeNode.new(-7))
  system("clear")
  puts "The tree:"
  puts "Root node: #{n1.root}, with height #{n1.get_height}"
  puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Second level children: [#{n1.leftchild.leftchild.value}, #{n1.leftchild.rightchild.value}] [#{n1.rightchild.leftchild.value}, #{n1.rightchild.rightchild.value}]"
  puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"
  p n1.traverse
  puts "\n\nAnd deleting two elements..."
  n1.search(14).delete
  n1.search(-7).delete

  puts "Root node: #{n1.root}, with height #{n1.get_height}"
  puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"

  p n1.traverse
end
