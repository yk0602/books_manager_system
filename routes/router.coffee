express = require 'express'
controller = require '../controllers/controller'
router = express.Router()
router.get '/register', controller.registerGet
router.post '/register', controller.registerPost
router.get '/login', controller.loginGet
#权限判断，如果用户未登录，重定向至登录页面
router.use controller.permissionController
router.get '/',controller.indexGet
module.exports = router