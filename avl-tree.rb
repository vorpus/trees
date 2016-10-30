require_relative 'bst'

class AVLTreeNode < BinaryTreeNode

  def initialize(value)
    @height = 0
    super
  end

  def right_rotate
    if @rightchild
      @rightchild.parent =  self.parent
    end

    upper_node = parent.parent
    parent.parent = self
    #logic for if parent has parent
    if upper_node
      self.parent = upper_node
    else
      @parent = nil
    end
  end

  def left_rotate
    if @leftchild
      lefty = @leftchild
      @leftchild.parent = self.parent

    end

    upper_node = parent.parent
    parent.parent = self

    if upper_node
      # debugger
      self.parent = upper_node

    else
      @parent = nil
    end

    # p self.rightchild.leftchild
  end

  def self.single_rotation_test
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
    puts "The tree after right rotation:"
    puts "Root node: #{n1.root}, with height #{n1.root.get_height}"
    puts "First level children: [#{n1.root.leftchild.value}, #{n1.root.rightchild.value}]"
    puts "Second level children: [#{n1.root.rightchild.leftchild}, #{n1.root.rightchild.rightchild}]"
    puts "Tree range: #{n1.root.minimum.value}   #{n1.root.maximum.value}"
    p n1.root.traverse

    n1.search(5).left_rotate
    print "\n\n"
    puts "The tree after left rotation:"
    puts "Root node: #{n1.root}, with height #{n1.get_height}"
    puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
    puts "Second level children: [#{n1.leftchild.leftchild.value}, #{n1.leftchild.rightchild.value}]"
    puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"
    p n1.traverse
  end

  def self.single_rotation_parent_test
    n1 = AVLTreeNode.new(6)
    n1.insert(AVLTreeNode.new(4))
    n1.insert(AVLTreeNode.new(9))
    n1.insert(AVLTreeNode.new(1))
    n1.insert(AVLTreeNode.new(5))
    n1.insert(AVLTreeNode.new(8))
    n1.insert(AVLTreeNode.new(7))

    #     Starting tree
    #         6
    #       /   \
    #     4      9
    #   /   \   /
    #  1    5  8
    #         /
    #        7
    p "Before rotation:"
    p "Tree height: #{n1.get_height}"
    p "Left child height: #{n1.leftchild.get_height}"
    p "Right child height: #{n1.rightchild.get_height}"

    n1.search(8).right_rotate

    #     Ending tree
    #         6
    #       /   \
    #     4      8
    #   /   \   / \
    #  1    5  7   9
    puts "\n\nAfter rotation:"
    p "Tree height: #{n1.get_height}"
    p "Left child height: #{n1.leftchild.get_height}"
    p "Right child height: #{n1.rightchild.get_height}"
  end

end

if __FILE__ == $PROGRAM_NAME
  # AVLTreeNode.single_rotation_test
  # AVLTreeNode.single_rotation_parent_test

  n1 = AVLTreeNode.new(20)
  n1.insert(AVLTreeNode.new(10))
  n1.insert(AVLTreeNode.new(5))
  n1.insert(AVLTreeNode.new(30))
  n1.insert(AVLTreeNode.new(25))
  n1.insert(AVLTreeNode.new(40))
  n1.insert(AVLTreeNode.new(35))
  n1.insert(AVLTreeNode.new(45))
  n1.insert(AVLTreeNode.new(34))
  p "Unbalanced tree before rotation:"
  p "Tree height: #{n1.get_height}"
  p "Left child height: #{n1.leftchild.get_height}"
  p "Right child height: #{n1.rightchild.get_height}"

  n1.search(35).right_rotate
  p n1.traverse
  # p n1.search(34).parent
  n1.search(35).left_rotate

  # p n1.search(34)
  puts"\n\nAfter rotation:"
  p "Tree height: #{n1.get_height}"
  p "Left child height: #{n1.leftchild.get_height}"
  p "Right child height: #{n1.rightchild.get_height}"
  p n1.traverse


end
