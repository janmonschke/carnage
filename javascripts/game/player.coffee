window.CarnageGame ?= {}
window.CarnageGame.Player = class extends CarnageGame.Mob
  tileX: 0
  tileY: 64
  constructor: (@game, @inputHandler) ->
    @direction = 0
    @health = 100

  findSpawn: (level) ->
    spawn = level.getRandomSpawn()

    @x = spawn.x * 32
    @y = spawn.y * 32

  tick: ->
    xa = 0
    ya = 0
    if @inputHandler.isPressed 'up' then ya -= 2
    if @inputHandler.isPressed 'left' then xa -= 2
    if @inputHandler.isPressed 'right' then xa += 2
    if @inputHandler.isPressed 'down' then ya += 2

    @x += xa
    @y += ya

  render: (screen) ->
    screen.render @x, @y, this