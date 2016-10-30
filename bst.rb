require 'byebug'

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
      if self.value < self.parent.value
        @parent.leftchild = nil if @parent.leftchild == self
      else
        @parent.rightchild = nil if @parent.rightchild == self
      end
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
    self.value.to_s
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

  def root
    return self if parent == nil
    parent.root
  end

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

  def delete
    if children.nil? #leaf
      self.parent = nil
      return self
    elsif @leftchild && @rightchild #both left and right child
      minimum = @rightchild.minimum.delete
      # p @rightchild.minimum
      @leftchild.parent = minimum
      @rightchild.parent = minimum
      minimum.parent = self.parent
    else #only has one child
      singlechild = @leftchild || @rightchild
      singlechild.parent = self.parent
    end
    self
  end

  def traverse2 # old
    if self.children == nil
      p self
      return self
    end
    @leftchild.traverse2 if @leftchild
    p self
    @rightchild.traverse2 if @rightchild
  end

  def traverse # can't make it work without flatten?
    return self.value if self.children == nil
    nodevals = []
    nodevals << @leftchild.traverse  unless self.leftchild.nil?
    nodevals << self.value
    nodevals << self.rightchild.traverse  unless self.rightchild.nil?
    nodevals.flatten
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
  puts "Parent node: #{n1}, with height #{n1.get_height}"
  puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Second level children: [#{n1.leftchild.leftchild.value}, #{n1.leftchild.rightchild.value}] [#{n1.rightchild.leftchild.value}, #{n1.rightchild.rightchild.value}]"
  puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"
  p n1.traverse
  puts "\n\nAnd deleting two elements..."
  n1.search(18).delete
  n1.search(-7).delete

  puts "Parent node: #{n1}, with height #{n1.get_height}"
  puts "First level children: [#{n1.leftchild.value}, #{n1.rightchild.value}]"
  puts "Tree range: #{n1.minimum.value}   #{n1.maximum.value}"

  p n1.traverse
end
