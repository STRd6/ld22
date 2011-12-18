Wall = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    solid: true
    width: 32
    height: 32

  # Inherit from game object
  self = Base(I)

  self.bind "hit", ->
    Sound.play "ping"

  # We must always return self as the last line
  return self

