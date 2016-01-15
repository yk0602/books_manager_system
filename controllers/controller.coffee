usersModel = require '../models/usersModel'
module.exports =
  registerGet:(req, res) ->
    res.render 'register'

  registerPost:(req, res) ->
    usersModel.createUser req.body.username, req.body.password, req.body.email, (err, data) ->
      if err
        res.redirect 301, '/register'
      else
        res.redirect 301, '/login'

  loginGet:(req, res) ->
    res.cookie 'user', 'admin', {httpOnly:true}
    res.render 'login'

  permissionController:(req, res, next) ->
    if req.cookies?.user?
      next()
    else
      res.redirect 301, '/login'

  indexGet:(req, res) ->
    res.render 'index'