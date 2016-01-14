require('coffee-script').register()
express = require 'express'
http = require 'http'
routes = require './routes/router'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

app = express()
server = http.createServer app

app.use cookieParser()
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended:true)
#view engine setup
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use express.static(__dirname + '/public')

app.use '/', routes

app.use (req, res, next) ->
  res.type 'text/plain'
  res.status 404
  res.send '404 - Not Found'

app.use (req, res, next) ->
  console.log err.stack
  res.type 'text/plain'
  res.status 500
  res.send '500 - Server Error'

server.listen 8080, () ->
  console.log 'Server is listening on port 8080'