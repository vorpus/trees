# future functionality
# delete node

class BinaryTreeNode
  attr_accessor :leftchild, :rightchild
  attr_reader :value

  def initialize(value)
    @value = value
    @parent = nil
    @leftchild = nil
    @rightchild = nil
  end

  def parent
    @parent
  end

  def children
    @leftchild || @rightchild
  end

  def parent=(step_parent)
    if self.parent
      self.value < self.parent.value ? @parent.leftchild = nil : @parent.rightchild = nil
    end
    @parent = step_parent
    if self.parent
      self.value < self.parent.value ? @parent.leftchild = self : @parent.rightchild = self
    end
  end

  def inspect
    self.value
  end

  def to_s
    self.value
  end

  def minimum
    @leftchild ? @leftchild.minimum : self
  end

  def maximum
    @rightchild ? @rightchild.maximum : self
  end

  # def add_child (child_node)
  #   child_node.parent = self
  #   self.children << child_node unless self.children.include?(child_node)
  # end
  #
  # def remove_child (child_node)
  #   raise "Not a child!" unless @children.include?(child_node)
  #   child_node.parent = nil
  #   self.children.delete(child_node)
  # end

  def search (target_value)
    case target_value <=> self.value
    when -1
      return self unless self.leftchild
      self.leftchild.search (target_value)
    when 0
      return self
    when 1
      return self unless self.rightchild
      self.rightchild.search (target_value)
    end
  end

  def insert (new_node)
    tree_searched = self.search(new_node.value)
    if tree_searched.value == new_node.value
      raise "Can't have two same values in BST"
    end
    new_node.parent = tree_searched
  end

end

if __FILE__ == $PROGRAM_NAME
  n1 = BinaryTreeNode.new(5)
  n2 = BinaryTreeNode.new(2)
  n3 = BinaryTreeNode.new(18)
  n4 = BinaryTreeNode.new(-4)
  n5 = BinaryTreeNode.new(3)
  n6 = BinaryTreeNode.new(20)
  #
  n1.insert(n2)
  n1.insert(n3)
  n1.insert(n4)
  n1.insert(n5)
  n1.insert(n6)
  n1.insert(BinaryTreeNode.new(22))
  n1.insert(BinaryTreeNode.new(16))
  n1.insert(BinaryTreeNode.new(14))

  p "Parent node: #{n1}"
  p "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  p "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"

  p "Minimum of right subtree: #{n1.rightchild.minimum.value}"


  # # this should work
  # p n1.dfs("root6")
  # p n1.bfs("root6")#.value
end
