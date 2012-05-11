window.CarnageGame ?= {}
window.CarnageGame.Entity = class
  tileX: 0
  tileY: 0
  tileW: 32
  tileH: 32
  xr: -2 # x-distance to obstacle
  yr: -2 # y-distance to obstacle
  constructor: (@level) ->
    @removed = false

  init: (@level) ->
    null

  tick: ->
    null

  render: (screen) ->
    null

  remove: ->
    @removed = true

  move: (xa, ya) ->
    stopped = true
    if xa != 0 and @mayMove(xa, 0)
      stopped = false
    if ya != 0 and @mayMove(0, ya)
      stopped = false

    return !stopped

  mayMove: (xa, ya) ->
    stopped = false
    
    x0 = ((@x + xa) - @xr) >> 5
    x1 = ((@x + xa) + @xr + @tileW) >> 5
    y0 = ((@y + ya) - @yr) >> 5
    y1 = ((@y + ya) + @yr + @tileH) >> 5

    for yt in [y0..y1]
      for xt in [x0..x1]
        tile = @level.getTile(xt, yt)
        if tile
          unless tile.mayPass(@level, xt, yt, this)
            stopped = true
            return false

    if stopped
      return false

    @x += xa
    @y += ya
