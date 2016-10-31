require_relative 'bst'

class AVLTreeNode < BinaryTreeNode

  def initialize(value)
    super
  end

  def balance
    if self.leftchild.nil?
      lh = 0
    else
      lh = self.leftchild.height + 1
    end

    if self.rightchild.nil?
      rh = 0
    else
      rh = self.rightchild.height + 1
    end

    lh-rh
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
      self.parent = upper_node
    else
      @parent = nil
    end
  end


  def insert (new_node)
    tree_searched = self.search(new_node.value)
    if tree_searched.value == new_node.value
      raise "Can't have two same values in BST"
    end
    new_node.parent = tree_searched


    if new_node.root.balance.abs > 1
      if new_node.value < new_node.parent.value && new_node.parent.value < new_node.parent.parent.value
        p "single right rotation"
        new_node.parent.right_rotate
      elsif new_node.value > new_node.parent.value && new_node.parent.value < new_node.parent.parent.value
        p "left right rotate"
        pivot = new_node.parent
        new_node.left_rotate
        pivot.right_rotate
      elsif new_node.value > new_node.parent.value && new_node.parent.value > new_node.parent.parent.value
        p "single left rotation"
        new_node.parent.left_rotate
      elsif new_node.value > new_node.parent.value && new_node.parent.value < new_node.parent.parent.value
        p "right left rotate"
        pivot = new_node.parent
        new_node.right_rotate
        pivot.left_rotate
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  # AVLTreeNode.single_rotation_test
  # AVLTreeNode.single_rotation_parent_test

  n1 = AVLTreeNode.new(20)
  n1.root.insert(AVLTreeNode.new(19))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  n1.root.insert(AVLTreeNode.new(18))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  n1.root.insert(AVLTreeNode.new(17))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  n1.root.insert(AVLTreeNode.new(16))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  n1.root.insert(AVLTreeNode.new(15))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  n1.root.insert(AVLTreeNode.new(14))
  p "Tree rooted at #{n1.root} with height #{n1.root.height} and balance #{n1.root.balance}"
  p n1.root.rightchild
  p n1.root.traverse

end
