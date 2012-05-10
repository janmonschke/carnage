window.CarnageGame ?= {}
window.CarnageGame.Player = class extends CarnageGame.Mob
  tileX: 0
  tileY: 64
  constructor: (@game) ->
    @direction = 0
    @health = 100

  findSpawn: (level) ->
    spawn = level.getRandomSpawn()

    @x = spawn.x * 32
    @y = spawn.y * 32

  render: (screen) ->
    screen.render @x, @y, this