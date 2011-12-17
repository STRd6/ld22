MainGame = (I={}) ->
  # Inherit from game object
  self = GameState(I)

  self.add
    class: "Player"

  self.add
    class: "Terminal"
    x: 128
    y: 256

  # We must always return self as the last line
  return self

