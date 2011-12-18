PlayerHealth = (I={}, self) ->
  # Set some default properties
  Object.reverseMerge I,
    health: 1024
    health_max: 1024
    oxygen: 1024
    oxygen_max: 1024

  # Add events and methods here
  self.bind "update", ->
    I.health = I.health.approach(0, 1)
    I.oxygen = I.oxygen.approach(0, 2)

  drawMeter = (canvas, attribute, color, start) ->
    ratio = I[attribute] / I["#{attribute}_max"]
    padding = 2
    maxWidth = 128
    height = 8

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
    drawMeter(canvas, "health", "#A00", Point(16, 16))
    drawMeter(canvas, "oxygen", "#00A", Point(256, 16))
