mongoose = require './connection'

userSchema = mongoose.Schema
  username:String
  password:String
  email:String
User = mongoose.model 'User', userSchema

createUser = (username, password, email, cb) ->
  User.find()
  .or [{email:email}, {username:username}]
  .exec (err, data) ->
    if !err && data.length is 0
      new User {username:username, password:password, email:email}
      .save (err, user) ->
        if err
          cb new Error('注册失败1'), null
        else
          cb null, user
    else
      cb new Error('注册失败2'), null

getUserByEmail = (email, password, cb) ->
  User.find()
  .or [{email:email}, {password:password}]
  .exec (err, data) ->
    if !err && data
      cb null, data

validateUser = (email, password, cb) ->
  User.findOne {'email':email, "password":password}, null, null, (err, user) ->
    if err
      console.error err
      cb err, null
    else
      cb null, user



module.exports =
  createUser:createUser
  getUserByEmail:getUserByEmail
  validateUser:validateUser