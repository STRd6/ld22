TitleScreen = (I={}) ->
  # Inherit from game object
  self = GameState(I)

  self.bind 'draw', (canvas) ->
    canvas.font("bold 16px consolas, 'Courier New', 'andale mono', 'lucida console', monospace")

    canvas.centerText
      color: "white"
      text: "Space Alone"
      position: Point(App.width, App.height).scale(0.5)

  self.bind 'enter', ->
    self.add
      class: "Background"

  self.bind 'update', ->
    if keydown.space
      engine.setState MainGame()

  # We must always return self as the last line
  return self

