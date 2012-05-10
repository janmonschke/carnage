window.CarnageGame ?= {}
window.CarnageGame.Tile = class
  constructor: ->
    null

  tick: ->
    null

  render: (context, level, x, y) ->
    null

  mayPass: (level, x, y, entity) ->
    true

  hurt: (level, x, y, source, dmg) ->
    null

  steppedOn: (level, x, y, entity) ->
    null  