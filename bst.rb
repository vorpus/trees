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

  def get_height
    return 0 if self.children.nil?
    if @leftchild.nil? || @rightchild.nil?
      only_child = @leftchild || @rightchild
      1+ only_child.get_height
    else
      1+ [@leftchild.get_height, @rightchild.get_height].max
    end
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

  def delete (value)
    
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

  p "Parent node: #{n1}, with height #{n1.get_height}"
  p "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Second level children: [#{n1.leftchild.leftchild.value}, #{n1.leftchild.rightchild.value}] [#{n1.rightchild.leftchild.value}, #{n1.rightchild.rightchild.value}]"
  p "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"


  # # this should work
  # p n1.dfs("root6")
  # p n1.bfs("root6")#.value
end
