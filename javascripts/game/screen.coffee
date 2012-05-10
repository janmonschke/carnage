window.CarnageGame ?= {}
window.CarnageGame.Screen = class
  constructor: (@context) ->
    @offsetX = 0
    @offsetY = 0

    @spriteSheet = new Image()
    @spriteSheet.src = "/images/sprites.png"

  render: (x, y, tile) ->
    # render tile to context
    @context.drawImage @spriteSheet
      , tile.tileX             # sx
      , tile.tileY             # sy
      , tile.tileW             # sw
      , tile.tileH             # sh
      , x - @offsetX           # dx
      , y - @offsetY           # dy
      , tile.tileW             # dw
      , tile.tileH             # dh

  setOffset: (@offsetX, @offsetY) -> null
  getWidth: -> @context.canvas.width
  getHeight: -> @context.canvas.height
  clear: ->
    @context.clearRect 0, 0, @getWidth(), @getHeight()