Base = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    zIndex: 0

  # Inherit from game object
  self = GameObject(I)

  # Add events and methods here
  self.bind "update", ->
    I.zIndex = I.y

  self.bind "debugDraw", (canvas) ->
    # Debug
    canvas.drawRect
      bounds: self.bounds()
      color: "rgba(255, 0, 0, 0.5)"

  # We must always return self as the last line
  return self

