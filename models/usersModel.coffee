mongoose = require './connection'

userSchema = mongoose.Schema
  username:String
  password:String
  email:String
User = mongoose.model 'User', userSchema

createUser = (username, password, email, cb) ->
  getUserByUsername username, (err, data) ->
    if !err && !data
      new User {username:username, password:password, email:email}
      .save (err, user) ->
        if err
          console.error err
          cb err, null
        else
          cb null, user
    else if !err && data
      cb new Error('用户名已经存在或者查询'), null
    else
      cb err, null

getUserByUsername = (username, cb) ->
  User.findOne 'username':username, (err, user) ->
    if err
      console.error err
      cb err, null
    else
      cb null, user




module.exports =
  createUser:createUser
  getUserByUsername:getUserByUsername