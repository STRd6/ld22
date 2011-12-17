Player = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "guy"
    width: 24
    speed: 4

  # Inherit from game object
  self = Base(I)

  self.include PlayerMovement

  self.bind "update", ->
    # Print debug info to console
    if justPressed.f2
      console.log engine.find("Wall")

  # We must always return self as the last line
  return self

