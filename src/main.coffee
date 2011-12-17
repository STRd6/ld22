window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Tilemap"]

engine.setState TitleScreen()

engine.bind 'overlay', (canvas) ->
  engine.objects().invoke('trigger', 'debugDraw', canvas)

engine.start()

Music.play "alon"

