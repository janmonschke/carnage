window.CarnageGame ?= {}
window.CarnageGame.Game = class
  constructor: (@canvas) ->
    @level = new CarnageGame.Level('cg_intro.map')
    @level.on 'load', (e) =>
      unless e?
        console.log 'level loaded'
      else
        console.log e