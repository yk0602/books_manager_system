usersModel = require '../models/usersModel'
fs = require 'fs'
module.exports =
  registerPost:(req, res) ->
    usersModel.createUser req.body.username, req.body.password, req.body.email, (err, data) ->
      if err
        console.error err
        res.send {status:'failed'}
      else
        console.log '注册成功'
        res.send {status:'succeeded'}

  loginPost:(req, res) ->
    usersModel.validateUser req.body.email, req.body.password, (err, data) ->
      if err || !data
        res.send {status:'failed'}
      else
        res.send {status:'succeeded', username:data.username}

  permissionController:(req, res, next) ->
    if req.cookies?.email && req.cookies?.password
      next()
    else
      res.redirect 301, '/login'

  indexGet:(req, res) ->
    fs.readFile __dirname + 'views/', (err, data) ->
      if !err
        res.statusCode 200
        res.contentType 'text/html'
        res.send data