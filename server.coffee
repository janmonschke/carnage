express = require('express')

app = express.createServer()

app.configure ->
  app.use express.methodOverride()
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.session secret: '9s8dfhosn0ddsf9wbg3sv435hhd2g4'
  app.use app.router
  app.set 'view engine', 'jade'
  app.use express.static __dirname

app.listen process.env['app_port'] or 3000