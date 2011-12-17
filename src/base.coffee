Base = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    zIndex: 0

  # Inherit from game object
  self = GameObject(I)

  # Add events and methods here
  self.bind "update", ->
    I.zIndex = I.y

  # We must always return self as the last line
  return self

