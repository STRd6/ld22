PlayerHealth = (I={}, self) ->
  # Set some default properties
  Object.reverseMerge I,
    maxHealth: 1024
    health: 1024
    maxOxygen: 1024
    oxygen: 1024

  # Add events and methods here
  self.bind "update", ->
    I.health -= 1
    I.oxygen -= 1

  drawMeter = (canvas) ->
    ratio = I.health / I.maxHealth
    padding = 2
    maxWidth = 128
    height = 8

    start = Point(32, 32)

    canvas.drawRoundRect
      color: "#FFF"
      x: start.x - padding
      y: start.y - padding
      width: maxWidth + 2*padding
      height: height + 2*padding
      radius: 3

    color = "#800"

    canvas.drawRoundRect {
      color: color
      position: start
      width: maxWidth * ratio
      height
      radius: 2
    }

  drawHealthMeters: (canvas) ->
    drawMeter(canvas)

