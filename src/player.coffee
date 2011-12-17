PLAYER_SPRITE = Sprite.loadByName "guy"

Player = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    sprite: PLAYER_SPRITE
    speed: 4

  I.width = 24
  I.height = 32

  # Inherit from game object
  self = Base(I)

  self.include PlayerMovement

  self.bind "update", ->
    # Print debug info to console
    if justPressed.f2
      console.log engine.find("Wall")

  # We must always return self as the last line
  return self

