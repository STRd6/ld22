window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()
  includedModules: ["Tilemap"]

engine.setState TitleScreen()

engine.start()

Music.play "alon"

