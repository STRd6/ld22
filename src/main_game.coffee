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

      Object.extend playerData,
        class: "Player"
        x: App.width/2
        y: App.height/2

      player = self.add playerData

  self.bind 'overlay', (canvas) ->
    if player = engine.find("Player").first()
      player.drawHealthMeters(canvas)

  # We must always return self as the last line
  return self

