Box = (I={}) ->
  # Set some default properties
  Object.reverseMerge I,
    height: 32
    width: 32

  # Inherit from game object
  self = Base(I)

  particleSizes = [5, 4, 3]

  self.bind "destroy", ->
    engine.add
      class: "Emitter"
      duration: 9
      sprite: Sprite.EMPTY
      particleCount: 5
      batchSize: 5
      x: I.x
      y: I.y
      zIndex: I.y
      generator:
        color: "#fff"
        duration: 8
        height: (n) ->
          particleSizes.wrap(n)
        maxSpeed: 50
        velocity: (n) ->
          Point.fromAngle(Random.angle()).scale(rand(5) + 2)
        width: (n) ->
          particleSizes.wrap(n)

    engine.add
      class: "Item"
      type: "health"
      sprite: "health"
      x: I.x
      y: I.y

  self.bind "hit", ->
    self.destroy()

  # We must always return self as the last line
  return self

