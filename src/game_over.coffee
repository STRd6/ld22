GameOver = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    won: false

  # Inherit from game object
  self = GameState(I)

  # Add events and methods here
  self.bind "draw", (canvas) ->
    if I.won
      text = "You Won!"
    else
      text = "There were no survivors..."

    canvas.font("bold 16px consolas, 'Courier New', 'andale mono', 'lucida console', monospace")

    canvas.centerText
      color: "white"
      text: text
      position: Point(App.width, App.height).scale(0.5)

    canvas.centerText
      color: "white"
      text: "Time: #{(playerData.I.age / 30).toFixed(2)}s"
      position: Point(App.width, App.height).scale(0.5).add(Point(128, 128))

  # We must always return self as the last line
  return self

