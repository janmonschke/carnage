window.CarnageGame ?= {}
window.CarnageGame.Player = class extends CarnageGame.Mob
  tileX: 0
  tileY: 64
  constructor: (@game, @inputHandler) ->
    @direction = 0
    @health = 100
    @rotation = 0
    @tickCount = 0

  findSpawn: (@level) ->
    spawn = @level.getRandomSpawn()

    @x = spawn.x * 32
    @y = spawn.y * 32

  tick: (offsetX, offsetY) ->
    @tickCount++

    xa = 0
    ya = 0
    if @inputHandler.isPressed 'up' then ya -= 2
    if @inputHandler.isPressed 'left' then xa -= 2
    if @inputHandler.isPressed 'right' then xa += 2
    if @inputHandler.isPressed 'down' then ya += 2

    @move xa, ya

    mousePosition = @inputHandler.getMousePosition()
    @rotation = Math.atan2(@y + @tileH / 2 - mousePosition.y - offsetY, @x + @tileW / 2 - mousePosition.x - offsetX)

    if @inputHandler.isPressed('shoot') and Math.round(@tickCount % 5) is 0
      @level.add new CarnageGame.Entities.Bullet(this, Math.cos(@rotation) * -1 * 10, Math.sin(@rotation) * -1 * 10)

  render: (screen) ->
    screen.renderWithRotation @x, @y, @rotation, this

    if window.debugLevel > 0
      mousePosition = @inputHandler.getMousePosition()
      ctx = $('canvas#game')[0].getContext('2d')
      ctx.strokeStyle = "#ff0000"
      ctx.lineWidth = 1
      ctx.beginPath()
      ctx.moveTo @x - screen.offsetX + @tileW / 2, @y - screen.offsetY + @tileW / 2
      ctx.lineTo mousePosition.x, mousePosition.y
      ctx.closePath()
      ctx.stroke()