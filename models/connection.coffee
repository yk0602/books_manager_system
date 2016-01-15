mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/college_market'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error')
db.once 'open', () ->
  console.log 'a MongoDB connection opened success'

module.exports = mongoose
