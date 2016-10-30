require_relative 'bst'

class AVLTreeNode < BinaryTreeNode

  def initialize(value)
    @height = 0
    super
  end

  def right_rotate
    if @rightchild
      # parent.leftchild = @rightchild
      @rightchild.parent =  self.parent
    end
    parent.parent = self
    self.parent = nil
  end

end

if __FILE__ == $PROGRAM_NAME
  n1 = AVLTreeNode.new(5)
  n2 = AVLTreeNode.new(2)
  n1.insert(n2)
  n1.insert(AVLTreeNode.new(18))
  n1.insert(AVLTreeNode.new(1))
  n1.insert(AVLTreeNode.new(3))
  system("clear")
  puts "The tree:"
  puts "Root node: #{n1.root}, with height #{n1.get_height}"
  puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Second level children: [#{n1.leftchild.leftchild.value}, #{n1.leftchild.rightchild.value}]"
  puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"
  p n1.traverse

  n1.search(2).right_rotate
  print "\n\n"
  puts "The tree:"
  puts "#{n1.leftchild}"
  puts "Root node: #{n1.root}, with height #{n1.root.get_height}"
  puts "First level children: [#{n1.root.leftchild.value}, #{n1.root.rightchild.value}]"
  # puts "Second level children: [#{n1.root.rightchild.leftchild.value}, #{n1.root.rightchild.rightchild.value}]"
  puts "Tree range: #{n1.root.minimum.value}   #{n1.root.maximum.value}"
  p n1.root.traverse
end
