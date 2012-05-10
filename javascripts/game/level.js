// Generated by CoffeeScript 1.3.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

if (window.CarnageGame == null) {
  window.CarnageGame = {};
}

window.CarnageGame.Level = (function(_super) {

  __extends(_Class, _super);

  function _Class(name) {
    var _this = this;
    this.name = name;
    this.TILES = {
      0x00000000: CarnageGame.Tiles.Wall,
      0x00FFFFFF: CarnageGame.Tiles.Floor,
      0x000000FF: CarnageGame.Tiles.Spawn
    };
    this.imageLoaded = false;
    this.data = [];
    this.entities = [];
    this.image = new Image();
    this.image.src = 'maps/' + this.name;
    this.image.onload = function() {
      _this.imageLoaded = true;
      return _this.parseLevel();
    };
    after(2000, function() {
      if (!_this.imageLoaded) {
        return _this.emit('load', new Error('File maps/' + _this.name + ' could not be loaded.'));
      }
    });
  }

  /*
      CarnageGame::Level.parseLevel()
  
      Creates a temporary canvas object, draws the level on it
      to use .getImageData() to finally generate a levels hash
  */


  _Class.prototype.parseLevel = function() {
    var data, hex, row, tile, x, y, _i, _j, _ref, _ref1;
    this.canvas = $('<canvas>');
    this.canvas[0].width = this.image.width;
    this.canvas[0].height = this.image.height;
    this.context = this.canvas[0].getContext('2d');
    this.context.drawImage(this.image, 0, 0);
    for (y = _i = 0, _ref = this.image.height; 0 <= _ref ? _i < _ref : _i > _ref; y = 0 <= _ref ? ++_i : --_i) {
      row = [];
      for (x = _j = 0, _ref1 = this.image.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; x = 0 <= _ref1 ? ++_j : --_j) {
        data = this.context.getImageData(x, y, 1, 1).data;
        hex = data[2] | (data[1] << 8) | (data[0] << 16);
        if (this.TILES[hex]) {
          tile = new this.TILES[hex](x, y);
          row.push(tile);
        } else {
          row.push(null);
        }
      }
      this.data.push(row);
    }
    return this.emit('load');
  };

  _Class.prototype.tick = function() {
    return null;
  };

  _Class.prototype.renderTiles = function(screen, scrollX, scrollY) {
    var h, tile, w, x, y, _i, _results;
    w = screen.getWidth() >> 4;
    h = screen.getHeight() >> 4;
    screen.setOffset(scrollX, scrollY);
    _results = [];
    for (y = _i = 0; 0 <= h ? _i < h : _i > h; y = 0 <= h ? ++_i : --_i) {
      _results.push((function() {
        var _j, _results1;
        _results1 = [];
        for (x = _j = 0; 0 <= w ? _j < w : _j > w; x = 0 <= w ? ++_j : --_j) {
          if (tile = this.data[y][x]) {
            _results1.push(tile.render(screen, this, x * 32, y * 32));
          } else {
            _results1.push(void 0);
          }
        }
        return _results1;
      }).call(this));
    }
    return _results;
  };

  _Class.prototype.renderEntities = function(screen, scrollX, scrollY) {
    var entity, _i, _len, _ref, _results;
    _ref = this.entities;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      entity = _ref[_i];
      _results.push(entity.render(screen));
    }
    return _results;
  };

  _Class.prototype.getRandomSpawn = function() {
    var spawns, x, y, _i, _j, _ref, _ref1;
    spawns = [];
    for (y = _i = 0, _ref = this.data.length; 0 <= _ref ? _i < _ref : _i > _ref; y = 0 <= _ref ? ++_i : --_i) {
      for (x = _j = 0, _ref1 = this.data[y].length; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; x = 0 <= _ref1 ? ++_j : --_j) {
        if (this.data[y][x] && this.data[y][x] instanceof CarnageGame.Tiles.Spawn) {
          spawns.push({
            x: x,
            y: y
          });
        }
      }
    }
    return spawns[Math.floor(Math.random() * spawns.length)];
  };

  _Class.prototype.add = function(entity) {
    if (entity instanceof CarnageGame.Player) {
      this.player = entity;
    }
    return this.entities.push(entity);
  };

  return _Class;

})(CarnageGame.EventEmitter);
