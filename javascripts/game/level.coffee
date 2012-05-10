window.CarnageGame ?= {}
window.CarnageGame.Level = class extends CarnageGame.EventEmitter
  constructor: (@name) ->
    @TILES =
      0xFF00FF: null
      0x000000: CarnageGame.Tiles.Wall
      0xFFFFFF: CarnageGame.Tiles.Floor
      0x0000FF: CarnageGame.Tiles.Spawn

    @imageLoaded = false

    @level = []

    @image = new Image()
    @image.src = 'maps/' + @name

    @image.onload = =>
      @imageLoaded = true
      @parseLevel()

    after 2000, =>
      unless @imageLoaded
        @emit 'load', new Error('File maps/' + @name + ' could not be loaded.')

  ###
    CarnageGame::Level.parseLevel()

    Creates a temporary canvas object, draws the level on it
    to use .getImageData() to finally generate a levels hash
  ###
  parseLevel: ->
    @canvas = $('<canvas>')
    $('body').append @canvas
    @canvas[0].width = @image.width
    @canvas[0].height = @image.height

    @context = @canvas[0].getContext '2d'
    @context.drawImage @image, 0, 0

    for x in [0...@image.width]
      row = []
      for y in [0...@image.height]
        data = @context.getImageData(x, y, 1, 1).data
        hex = data[2] | (data[1] << 8) | (data[0] << 16)

        if @TILES[hex]
          row.push new @TILES[hex](x, y)
        else
          row.push null
      @level.push row

    @emit 'load'
