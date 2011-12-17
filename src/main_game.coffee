MainGame = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "placeholder"
    width: 32

  # Inherit from game object
  self = GameState(I)

  self.add
    class: "Player"

  # We must always return self as the last line
  return self

