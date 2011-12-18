Item = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    height: 32
    width: 32
    type: "wrench"

  I.sprite ||= Sprite.loadByName(I.type)

  # Inherit from game object
  self = GameObject(I)

  # Add events and methods here
  self.bind "update", ->
    if I.age > 30
      Collision.collide "Player", self, (player) ->
        player.trigger "pickup", I.type
        I.active = false

  # We must always return self as the last line
  return self

