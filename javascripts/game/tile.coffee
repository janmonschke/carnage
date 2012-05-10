window.CarnageGame ?= {}
window.CarnageGame.Tile = class
  tileX: 0
  tileY: 0
  tileW: 1
  tileH: 1
  tile: null
  constructor: ->
    null

  tick: ->
    null

  render: (screen, level, x, y) ->
    screen.render x, y, this

  mayPass: (level, x, y, entity) ->
    true

  hurt: (level, x, y, source, dmg) ->
    null

  steppedOn: (level, x, y, entity) ->
    null  