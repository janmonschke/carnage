window.CarnageGame ?= {}
window.CarnageGame.Entities ?= {}
window.CarnageGame.Entities.Mob = class extends CarnageGame.Entity
  constructor: (@game) ->
    @direction = 0
    @health = 100

  hurt: (dmg) ->
    @health -= dmg