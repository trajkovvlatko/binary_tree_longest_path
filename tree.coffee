tree =
  label: "1"
  left:
    label: "2"
    left:
      label: "5"
      left:
        label: "8"
        left:
          label: "10"
          left: "12"
          right: "13"
        right:
          label: "11"
      right:
        label: "9"
    right:
      label: "4"

  right:
    label: "3"
    left:
      label: "6"
    right:
      label: "7"

c = 1
last = ""
max = 0

check_last = (pos) ->
  c = if last == pos then c + 1 else 1
  last = pos
  c
  
traverse = (node, func) ->
  func(node)
  if node.left
    c = check_last("left")
    traverse(node.left, func)
  if node.right
    c = check_last("right")
    traverse(node.right, func)

  max = c if max < c

traverse(tree, (node) ->
  console.log node.label  if node.label
)

console.log max
