Player = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "guy"
    width: 24
    speed: 4

  # Inherit from game object
  self = Base(I)

  self.include PlayerMovement

  # We must always return self as the last line
  return self

