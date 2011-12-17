window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Tilemap"]

engine.setState TitleScreen()

DEBUG_DRAW = true

engine.bind 'overlay', (canvas) ->
  if DEBUG_DRAW
    engine.objects().invoke('trigger', 'debugDraw', canvas)

engine.start()

Music.play "alon"

