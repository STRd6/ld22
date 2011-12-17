window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Tilemap"]

engine.setState TitleScreen()

DEBUG_DRAW = false

engine.bind 'overlay', (canvas) ->
  if DEBUG_DRAW
    engine.objects().invoke('trigger', 'debugDraw', canvas)

engine.start()

$(document).bind "keydown", "0", ->
  DEBUG_DRAW = !DEBUG_DRAW

Music.play "alon"

