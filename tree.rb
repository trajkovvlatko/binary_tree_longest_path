tree = {
  label: "1",
  left: {
    label: "2",
    left: {
      label: "5",
      left: {
        label: "8",
        left: {
          label: "10",
          left: "12",
          right: "13"
        },
        right: {
          label: "11"
        }
      },
      right: {
        label: "9"
      }
    },
    right: {
      label: "4"
    }
  },
  right: {
    label: "3",
    left: {
      label: "6"
    },
    right: {
      label: "7"
    }
  }
}


class BinaryTree

  attr_accessor :count, :max, :last

  def initialize
    self.count = 1
    self.max = 0
    self.last = ""
  end

  def is_hash(node)
    node.class.name.to_s == "Hash"
  end

  def check_last(pos)
    self.count = self.last == pos ? self.count + 1 : 1
    self.last = pos
  end

  def traverse(node, p_func)
    p_func.call(node)
    if node[:left] && is_hash(node[:left])
      check_last("left")
      traverse(node[:left], p_func)
    end
    if node[:right] && is_hash(node[:right])
      check_last("right")
      traverse(node[:right], p_func)
    end
    self.max = self.count if self.max < self.count
  end

end

b = BinaryTree.new
b.traverse(tree, Proc.new { |node|
  if node.class.name.to_s == "Hash"
    puts node[:label] if node[:label]
  end
})

puts "longest left or right path: #{b.max}"
