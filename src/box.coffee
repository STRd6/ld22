Box = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    height: 32
    width: 32

  # Inherit from game object
  self = Base(I)

  # We must always return self as the last line
  return self

