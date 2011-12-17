Wall = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    solid: true

  # Inherit from game object
  self = GameObject(I)

  # We must always return self as the last line
  return self

