MainGame = (I={}) ->
  # Inherit from game object
  self = GameState(I)

  self.add
    class: "Player"
    x: App.width/2
    y: App.height/2

  5.times (n) ->
    self.add
      class: "Terminal"
      x: (n + 1) * 96
      y: 256

  # We must always return self as the last line
  return self

