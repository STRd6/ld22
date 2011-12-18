TitleScreen = (I={}) ->
  I.age = 0

  # Inherit from game object
  self = GameState(I)

  self.bind 'draw', (canvas) ->
    canvas.font("bold 16px consolas, 'Courier New', 'andale mono', 'lucida console', monospace")

    canvas.centerText
      color: "white"
      text: "Space Alone"
      position: Point(App.width, App.height).scale(0.5)

    canvas.font("bold 12px consolas, 'Courier New', 'andale mono', 'lucida console', monospace")

    if I.age % 30 < 24
      canvas.centerText
        color: "white"
        text: "Press Space To Begin"
        position: Point(App.width, App.height).scale(0.5).add(Point(0, 50))

    canvas.centerText
      color: "white"
      text: "Press Space to hit things once you pick up a wrench"
      position: Point(App.width, App.height).scale(0.5).add(Point(0, 128))

    canvas.centerText
      color: "white"
      text: "Arrow Keys Move"
      position: Point(App.width, App.height).scale(0.5).add(Point(0, 150))

  self.bind 'enter', ->
    self.add
      class: "Background"

  self.bind 'update', ->
    I.age += 1
    if keydown.space
      engine.setState MainGame()

  # We must always return self as the last line
  return self

