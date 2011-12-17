terminalSprites = [0..3].map (n) ->
  Sprite.loadByName("terminal#{n}")

Terminal = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    height: 32
    sprite: "terminal0"
    width: 32

  # Inherit from game object
  self = GameObject(I)

  # Add events and methods here
  self.bind "update", ->
    if I.age % 4 == 0
      I.sprite = terminalSprites.rand()

  # We must always return self as the last line
  return self

