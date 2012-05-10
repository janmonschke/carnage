window.CarnageGame ?= {}
window.CarnageGame.Screen = class
  tileSize: 32
  constructor: (@context) ->
    @spriteSheet = new Image()
    @spriteSheet.src = "/images/sprites.png"

  render: (x, y, tile) ->
    # render tile to context
    @context.drawImage @spriteSheet
      , tile.tileX * @tileSize # sx
      , tile.tileY * @tileSize # sy
      , tile.tileW * @tileSize # sw
      , tile.tileH * @tileSize # sh
      , x * @tileSize          # dx
      , y * @tileSize          # dy
      , tile.tileW * @tileSize # dw
      , tile.tileH * @tileSize # dh

  getWidth: -> @context.canvas.width
  getHeight: -> @context.canvas.height