// Generated by CoffeeScript 1.3.1

if (window.CarnageGame == null) {
  window.CarnageGame = {};
}

window.CarnageGame.Screen = (function() {

  function _Class(context) {
    this.context = context;
    this.offsetX = 0;
    this.offsetY = 0;
    this.spriteSheet = new Image();
    this.spriteSheet.src = "/images/sprites.png";
  }

  _Class.prototype.render = function(x, y, tile) {
    return this.context.drawImage(this.spriteSheet, tile.tileX, tile.tileY, tile.tileW, tile.tileH, x - this.offsetX, y - this.offsetY, tile.tileW, tile.tileH);
  };

  _Class.prototype.setOffset = function(offsetX, offsetY) {
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    return null;
  };

  _Class.prototype.getWidth = function() {
    return this.context.canvas.width;
  };

  _Class.prototype.getHeight = function() {
    return this.context.canvas.height;
  };

  return _Class;

})();
