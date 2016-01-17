mongoose = require './connection'

userSchema = mongoose.Schema
  username:String
  password:String
  email:String
User = mongoose.model 'User', userSchema

createUser = (username, password, email, cb) ->
  getUserByEmail email, (err, data) ->
    if !err && !data
      new User {username:username, password:password, email:email}
      .save (err, user) ->
        if err
          console.error err
          cb err, null
        else
          cb null, user
    else if !err && data
      cb new Error('邮箱已经存在'), null
    else
      cb err, null

getUserByEmail = (email, cb) ->
  User.findOne 'email':email, (err, user) ->
    if err
      console.error err
      cb err, null
    else
      cb null, user

validateUser = (email, password, cb) ->
  User.findOne 'email':email, "password":password, (err, user) ->
    if err
      console.error err
      cb err, null
    else
      cb null, user



module.exports =
  createUser:createUser
  getUserByEmail:getUserByEmail
  validateUser:validateUser