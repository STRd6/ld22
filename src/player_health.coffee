PlayerHealth = (I={}, self) ->
  # Set some default properties
  Object.reverseMerge I,
    health: 1024
    health_max: 1024
    oxygen: 1024
    oxygen_max: 1024

  # Add events and methods here
  self.bind "update", ->
    I.oxygen = I.oxygen.approach(0, 2)

    if I.oxygen <= 0
      engine.setState(GameOver(won: false))

  drawMeter = (canvas, attribute, color, start) ->
    ratio = I[attribute] / I["#{attribute}_max"]
    padding = 2
    maxWidth = 128
    height = 8
    title = attribute.toUpperCase()

    canvas.font("bold 12px consolas, 'Courier New', 'andale mono', 'lucida console', monospace")

    canvas.drawText
      color: "white"
      position: start.subtract(Point(canvas.measureText(title) + 10, -10))
      text: title

    canvas.drawRoundRect
      color: "#FFF"
      x: start.x - padding
      y: start.y - padding
      width: maxWidth + 2*padding
      height: height + 2*padding
      radius: 3

    canvas.drawRoundRect {
      color: "#000"
      position: start
      width: maxWidth
      height
      radius: 2
    }

    canvas.drawRoundRect {
      color: color
      position: start
      width: maxWidth * ratio
      height
      radius: 2
    }

  heal: (amount) ->
    I.health = (I.health + amount).clamp(0, I.health_max)
  oxygenate: (amount) ->
    I.oxygen = (I.oxygen + amount).clamp(0, I.oxygen_max)

  drawHealthMeters: (canvas) ->
    drawMeter(canvas, "health", "#A00", Point(128, 16))
    drawMeter(canvas, "oxygen", "#00A", Point(412, 16))
