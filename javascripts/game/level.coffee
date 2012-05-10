window.CarnageGame ?= {}
window.CarnageGame.Level = class extends CarnageGame.EventEmitter
  constructor: (@name) ->
    @TILES =
      0x00000000: CarnageGame.Tiles.Wall
      0x00FFFFFF: CarnageGame.Tiles.Floor
      0x000000FF: CarnageGame.Tiles.Spawn

    @imageLoaded = false

    @data = []
    @entities = []

    # load map image
    @image = new Image()
    @image.src = 'maps/' + @name

    @image.onload = =>
      @imageLoaded = true
      @parseLevel()

    # did the image load timeout? emit an error
    after 2000, =>
      unless @imageLoaded
        @emit 'load', new Error('File maps/' + @name + ' could not be loaded.')

  ###
    CarnageGame::Level.parseLevel()

    Creates a temporary canvas object, draws the level on it
    to use .getImageData() to finally generate a levels hash
  ###
  parseLevel: ->
    # create temporary level canvas
    @canvas = $('<canvas>')
    @canvas[0].width = @image.width
    @canvas[0].height = @image.height

    # get context and draw level on canvas
    @context = @canvas[0].getContext '2d'
    @context.drawImage @image, 0, 0

    for y in [0...@image.height]
      row = []
      for x in [0...@image.width]
        # get rgba data
        data = @context.getImageData(x, y, 1, 1).data
        hex = data[2] | (data[1] << 8) | (data[0] << 16)

        # is there a tile for this rgba?
        if @TILES[hex]
          tile = new @TILES[hex](x, y)
          row.push tile
        else
          row.push null
      @data.push row

    # level is loaded
    @emit 'load'

  tick: ->
    for entity in @entities
      entity.tick()

  renderTiles: (screen, scrollX, scrollY) ->
    w = (screen.getWidth() + 32) >> 5
    h = (screen.getHeight() + 32) >> 5
    xo = scrollX >> 5
    yo = scrollY >> 5

    screen.setOffset scrollX, scrollY

    for y in [yo...h + yo]
      for x in [xo...w + xo]
        if @data[y] and @data[y][x]
          tile = @data[y][x]
          tile.render screen, this, x * 32, y * 32

  renderEntities: (screen, scrollX, scrollY) ->
    for entity in @entities
      entity.render screen

  getRandomSpawn: ->
    spawns = []
    for y in [0...@data.length]
      for x in [0...@data[y].length]
        if @data[y][x] and @data[y][x] instanceof CarnageGame.Tiles.Spawn
          spawns.push { x: x, y: y }

    return spawns[Math.floor(Math.random() * spawns.length)]

  add: (entity) ->
    if entity instanceof CarnageGame.Player
      @player = entity

    @entities.push entity