window.CarnageGame ?= {}
window.CarnageGame.Tiles ?= {}
window.CarnageGame.Tiles.Spawn = class extends CarnageGame.Tile
  tileX: 0
  tileY: 32
  render: (screen, level, x, y) ->
    super screen, level, x, y