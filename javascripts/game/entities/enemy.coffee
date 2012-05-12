window.CarnageGame ?= {}
window.CarnageGame.Entities ?= {}
window.CarnageGame.Entities.Enemy = class extends CarnageGame.Entities.Mob
  tileX: 0
  tileY: 64
  speed: 3
  constructor: (@game) ->
    @direction = 0
    @health = 100
    @rotation = 0
    @tickCount = 0

  findSpawn: (@level) ->
    spawn = @level.getRandomSpawn()

    @x = spawn.x * 32
    @y = spawn.y * 32

  tick: (offsetX, offsetY) ->
    null

  render: (screen) ->
    screen.renderWithRotation @x, @y, @rotation, this