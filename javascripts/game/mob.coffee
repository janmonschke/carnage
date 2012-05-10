window.CarnageGame ?= {}
window.CarnageGame.Mob = class extends CarnageGame.Entity
  constructor: (@game) ->
    @direction = 0
    @health = 100