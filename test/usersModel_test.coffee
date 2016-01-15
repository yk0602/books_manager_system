usersModel = require '../models/usersModel'

usersModel.getUserByUsername 'yk', (err, data) ->
  console.log 'test: ' + data + err