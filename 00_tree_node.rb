class PolyTreeNode
  attr_reader :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(step_parent)
    @parent.children.delete(self) if self.parent
    @parent = step_parent
    @parent.children << self if self.parent
  end

  def children
    @children
  end

  def inspect
    self.value
  end

  def add_child (child_node)
    child_node.parent = self
    self.children << child_node unless self.children.include?(child_node)
  end

  def remove_child (child_node)
    raise "Not a child!" unless @children.include?(child_node)
    child_node.parent = nil
    self.children.delete(child_node)
  end

  def dfs (target_value)
    return self if self.value == target_value

    self.children.each do |child|
      # p child.value
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs (target_value)
    queue = [self]


    until queue.empty?
      first = queue.shift
      # p first.value
      if first.value == target_value
        return first
      else
        queue += first.children
      end
    end
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  n1 = PolyTreeNode.new("root1")
  n2 = PolyTreeNode.new("root2")
  n3 = PolyTreeNode.new("root3")
  n4 = PolyTreeNode.new("root4")
  n5 = PolyTreeNode.new("root5")
  n6 = PolyTreeNode.new("root6")

  n2.parent = n1
  n3.parent = n1
  n4.parent = n2
  n5.parent = n2
  n6.parent = n3


  # this should work
  p n1.dfs("root6")
  p n1.bfs("root6")#.value
end
