window.engine = Engine
  backgroundColor: "black"
  canvas: $("canvas").pixieCanvas()

engine.setState TitleScreen()

engine.start()

Music.play "alon"

