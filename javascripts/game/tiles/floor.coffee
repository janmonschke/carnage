window.CarnageGame ?= {}
window.CarnageGame.Tiles ?= {}
window.CarnageGame.Tiles.Floor = class extends CarnageGame.Tile
  name: "Floor"
  render: (screen, level, x, y) ->
    super screen, level, x, y