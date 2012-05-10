window.CarnageGame ?= {}
window.CarnageGame.Game = class
  MAXFPS: 60
  constructor: (@canvas) ->
    @scrollX = 0
    @scrollY = 0

    @canvas[0].width = @canvas.width()
    @canvas[0].height = @canvas.height()

    @context = @canvas[0].getContext '2d'

    @screen = new CarnageGame.Screen(@context)

    ###
      Mr.doob's stats lib
    ###
    @stats = new Stats()
    @stats.setMode 0
    @stats.domElement.style.position = 'absolute'
    @stats.domElement.style.top = '5px'
    @stats.domElement.style.left = '5px'
    $('#canvas-wrapper').append @stats.domElement

    ###
      Load level
    ###
    @level = new CarnageGame.Level('cg_intro.png')
    @level.on 'load', (e) =>
      unless e?
        console.log 'level loaded'

        @inputHandler = new CarnageGame.InputHandler

        @player = new CarnageGame.Player this, @inputHandler
        @player.findSpawn(@level)

        @level.add @player

        @run()
      else
        console.log e

  run: ->
    ###
      Run game loop
    ###
    every 1000 / @MAXFPS, =>
      @stats.begin()

      @tick()
      @render()

      @stats.end()

  tick: ->
    @level.tick()

  render: ->
    @screen.clear()
    
    @scrollX = @player.x - @canvas[0].width / 2
    @scrollY = @player.y - @canvas[0].height / 2

    @level.renderTiles @screen, @scrollX, @scrollY
    @level.renderEntities @screen, @scrollX, @scrollY

    @inputHandler.renderCursor @screen