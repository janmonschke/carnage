window.CarnageGame ?= {}
window.CarnageGame.EventEmitter = class
  on: (name, fn) ->
    if !@$events
      @$events = {}

    if !@$events[name]
      @$events[name] = fn
    else if Array.isArray @$events
      @$events[name].push(fn)
    else
      @$events[name] = [@$events[name], fn]

    return this

  addListener: @on

  once: (name, fn) ->
    self = this

    _on = ->
      self.removeListener name, _on
      fn.apply this, arguments

    _on.listener = fn
    @on name, on

    return this

  removeListener: (name, fn) ->
    if @$events and @$events[name]
      list = @$events[name]

      if Array.isArray list
        pos = -1
        l = list.length
        for i in [0...l]
          if list[i] is fn or (list[i].listener and list[i].listener is fn)
            pos = i
            break

        if pos is 0
          return this

        list.splice pos, 1

        unless list.length
          delete @$events[name]
      else if list is fn or (list.listener and list.listener is fn)
        delete @$events[name]

    return this

  removeAllListeners: (name) ->
    if @$events and @$events[name]
      @$events[name] = null

    return this

  listeners: (name) ->
    unless @$events
      @$events = {}

    unless @$events[name]
      @$events[name] = []

    unless Array.isArray @$events[name]
      @$events[name] = [@$events[name]]

    return @$events[name]

  emit: (name) ->
    unless @$events
      return false

    handler = @$events[name]

    unless handler
      return false

    args = Array.prototype.slice.call arguments, 1

    if 'function' is typeof handler
      handler.apply this, args
    else if Array.isArray(handler)
      for listener in listeners
        listener.apply this, args
    else
      return false

    return true