window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Tilemap"]

engine.setState TitleScreen()

engine.start()

DEBUG_DRAW = false

$(document).bind "keydown", "0", ->
  DEBUG_DRAW = !DEBUG_DRAW

engine.bind 'overlay', (canvas) ->
  if DEBUG_DRAW
    engine.objects().invoke('trigger', 'debugDraw', canvas)

Music.play "alon"

