MainGame = (I={}) ->
  Object.reverseMerge I,
    level: "level1"

  # Inherit from game object
  self = GameState(I)

  self.bind "enter", ->
    engine.loadMap I.level, ->
      self.add
        class: "Background"

      window.playerData ||= {}

      start = engine.find(".start").first()
      start.destroy()

      Object.extend playerData,
        class: "Player"
        x: start.I.x
        y: start.I.y

      player = self.add playerData

  self.bind 'overlay', (canvas) ->
    if player = engine.find("Player").first()
      player.drawHealthMeters(canvas)

  # We must always return self as the last line
  return self

