window.after = (t, f) -> setTimeout f, t
window.every = (t, f) -> setInterval f, t

$(document).ready ->
  canvas = $('canvas#game')
  window.game = game = new CarnageGame.Game(canvas)