window.CarnageGame ?= {}
window.CarnageGame.Tiles ?= {}
window.CarnageGame.Tiles.Wall = class extends CarnageGame.Tile
  name: "Wall"
  tileX: 1
  tileY: 0
  mayPass: (level, x, y, entity) ->
    false

  render: (screen, level, x, y) ->
    super screen, level, x, y