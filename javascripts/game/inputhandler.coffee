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

    @keys = 
      up: up
      down: down
      right: right
      left: left

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

  isPressed: (id) ->
    if @keys[id]
      return @keys[id].isPressed()
    else
      return false