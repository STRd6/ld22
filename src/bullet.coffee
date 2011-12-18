Bullet = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    color: "red"
    radius: 6

  # Inherit from game object
  self = Base(I)

  # Add events and methods here
  self.bind "update", ->
    I.x += I.velocity.x
    I.y += I.velocity.y

  self.bind "create", ->
    Sound.play "pew"

  # We must always return self as the last line
  return self

