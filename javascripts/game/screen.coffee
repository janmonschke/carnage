window.CarnageGame ?= {}
window.CarnageGame.Screen = class
  constructor: (@context) ->
    @offsetX = 0
    @offsetY = 0

    @spriteSheet = new Image()
    @spriteSheet.src = "images/sprites.png"

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

  renderWithRotation: (x, y, rotation, tile) ->
    @context.save()

    @context.translate x + tile.tileW / 2 - @offsetX, y + tile.tileH / 2 - @offsetY
    @context.rotate rotation

    @context.drawImage @spriteSheet
      , tile.tileX             # sx
      , tile.tileY             # sy
      , tile.tileW             # sw
      , tile.tileH             # sh
      , tile.tileW / 2 * -1           # dx
      , tile.tileH / 2 * -1           # dy
      , tile.tileW             # dw
      , tile.tileH             # dh

    @context.restore()

  setOffset: (@offsetX, @offsetY) -> null
  getWidth: -> @context.canvas.width
  getHeight: -> @context.canvas.height
  clear: ->
    @context.clearRect 0, 0, @getWidth(), @getHeight()