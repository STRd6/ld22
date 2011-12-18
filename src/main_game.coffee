MainGame = (I={}) ->
  Object.reverseMerge I,
    level: "test"

  # Inherit from game object
  self = GameState(I)

  self.bind "enter", ->
    engine.loadMap I.level, ->
      self.add
        class: "Background"

      window.playerData ||= {}

      Object.extend playerData,
        class: "Player"
        x: App.width/2
        y: App.height/2

      player = self.add playerData

      camera = self.cameras().first()
      camera.I.cameraBounds = Rectangle
        x: -Infinity
        y: -Infinity
        width: Infinity
        height: Infinity
      camera.follow(player, "topdown")

  self.bind 'overlay', (canvas) ->
    if player = engine.find("Player").first()
      player.drawHealthMeters(canvas)

  # We must always return self as the last line
  return self

