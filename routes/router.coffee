express = require 'express'
router = express.Router()

router.get '/register', (req, res) ->
  res.render 'register'

router.post '/register', (req, res) ->
  console.log 'req....'
  console.log 'req: ' + JSON.stringify(req.body)
  res.render 'index'

router.get '/login', (req, res) ->
  res.cookie 'user', 'admin', {httpOnly:true}
  res.render 'login'
#权限判断，如果用户未登录，重定向至登录页面
router.use (req, res, next) ->
  if req.cookies?.user?
    next()
  else
    res.redirect 301, '/login'

router.get '/', (req, res) ->
  res.render 'index'

module.exports = router