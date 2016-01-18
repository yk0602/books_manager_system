usersModel = require '../models/usersModel'

#usersModel.getUserByUsername 'yk', (err, data) ->
#  console.log 'test: ' + data + err

#usersModel.validateUser 'yk0602@qq.com', '123', (err, data) ->
#  console.log 'test: ' + data

usersModel.createUser '', '123', 'yk0602@qq.com', (err, data) ->
  console.log err, data
