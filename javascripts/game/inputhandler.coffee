window.CarnageGame ?= {}

window.CarnageGame.Key = class
  constructor: ->
    @pressed = false

  press: ->
    @pressed = true

  release: ->
    @pressed = false

  isPressed: ->
    @pressed

window.CarnageGame.InputHandler = class
  constructor: ->
    up = new CarnageGame.Key()
    down = new CarnageGame.Key()
    right = new CarnageGame.Key()
    left = new CarnageGame.Key()

    @mouseX = 0
    @mouseY = 0

    @keys = 
      up: up
      down: down
      right: right
      left: left

    $('canvas#game').mousemove (e) =>
      offset = $('canvas#game').parent().offset()

      @mouseX = e.pageX - offset.left
      @mouseY = e.pageY - offset.top

    $(document).keydown (e) ->
      keyCode = e.keyCode
      switch keyCode
        when 38, 87
          up.press()
        when 37, 65
          left.press()
        when 40, 83
          down.press()
        when 39, 68
          right.press()

    $(document).keyup (e) ->
      keyCode = e.keyCode
      switch keyCode
        when 38, 87
          up.release()
        when 37, 65
          left.release()
        when 40, 83
          down.release()
        when 39, 68
          right.release()

  isPressed: (id) -> @keys[id]?.isPressed() or false
  getMousePosition: -> { x: @mouseX, y: @mouseY }
  renderCursor: (screen) ->
    screen.render @mouseX - 16, @mouseY - 16, tileX: 0, tileY: 32 * 3, tileW: 32, tileH: 32