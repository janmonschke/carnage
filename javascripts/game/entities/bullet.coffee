window.CarnageGame ?= {}
window.CarnageGame.Entities ?= {}
window.CarnageGame.Entities.Bullet = class extends CarnageGame.Entity
  tileX: 0
  tileY: 96
  tileW: 8
  tileH: 8
  xr: 0
  yr: 0
  speed: 2
  constructor: (@owner, @xa, @ya) ->
    @xa *= 10
    @ya *= 10

    @xa += Math.random() * 3
    @ya += Math.random() * 3

    @x = @owner.x + @owner.tileW / 2
    @y = @owner.y + @owner.tileH / 2

  tick: ->
    unless @move(@xa, @ya)
      @remove()

    hitEntities = @level.getEntitiesWithin @x, @y, @x + @tileW, @y + @tileH
    for hitEntity in hitEntities
      if (hitEntity instanceof CarnageGame.Entities.Mob) and not (hitEntity instanceof CarnageGame.Entities.Player)
        hitEntity.hurt(1)
        @remove()

  # make bullets stop on any obstacle
  move: (xa, ya) ->
    stopped = false
    unless @mayMove(xa, ya)
      stopped = true

    return !stopped

  render: (screen) ->
    screen.render @x, @y, this