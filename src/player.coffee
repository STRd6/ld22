PLAYER_SPRITE = Sprite.loadByName "guy"

Player = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "blue"
    sprite: PLAYER_SPRITE
    speed: 4
    level: 1
    items: {}

  I.width = 24
  I.height = 32

  # Inherit from game object
  self = Base(I)

  self.include PlayerMovement
  self.include PlayerHealth

  self.bind "update", ->
    # Print debug info to console
    if justPressed.f2
      console.log engine.find("Wall")

    if justPressed.space
      p = I.facing.scale(16)
      if I.items.wrench # Club
        engine.add
          class: "Hit"
          x: I.x + p.x
          y: I.y + p.y

  self.bind "pickup", (itemType) ->
    if itemType == "health"
      self.heal(256)
    else if itemType == "oxygen"
      self.oxygenate(512)
    else if itemType == "teleport"
      nextLevel = ["level2"].rand()
      engine.setState(MainGame(level: nextLevel))
    else
      I.items[itemType] = true

  self.bind "hit", ->
    I.health -= 64
    Sound.play "hurt"

  # We must always return self as the last line
  return self

