// Generated by CoffeeScript 1.3.1

if (window.CarnageGame == null) {
  window.CarnageGame = {};
}

window.CarnageGame.Tile = (function() {

  _Class.prototype.tileX = 0;

  _Class.prototype.tileY = 0;

  _Class.prototype.tileW = 32;

  _Class.prototype.tileH = 32;

  _Class.prototype.tile = null;

  function _Class() {
    null;

  }

  _Class.prototype.tick = function() {
    return null;
  };

  _Class.prototype.render = function(screen, level, x, y) {
    return screen.render(x, y, this);
  };

  _Class.prototype.mayPass = function(level, x, y, entity) {
    return true;
  };

  _Class.prototype.hurt = function(level, x, y, source, dmg) {
    return null;
  };

  _Class.prototype.steppedOn = function(level, x, y, entity) {
    return null;
  };

  return _Class;

})();
