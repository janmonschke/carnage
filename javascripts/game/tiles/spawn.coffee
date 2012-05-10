window.CarnageGame ?= {}
window.CarnageGame.Tiles ?= {}
window.CarnageGame.Tiles.Spawn = class extends CarnageGame.Tile
  name: "Spawn"
  tileX: 0
  tileY: 1
  render: (screen, level, x, y) ->
    super screen, level, x, y