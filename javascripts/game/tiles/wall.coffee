window.CarnageGame ?= {}
window.CarnageGame.Tiles ?= {}
window.CarnageGame.Tiles.Wall = class extends CarnageGame.Tile
  constructor: ->
    super()

  mayPass: (level, x, y, entity) ->
    false