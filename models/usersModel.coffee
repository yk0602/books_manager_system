es_client = require './connection'

userExistsOrNot = (username, email) ->
  es_client.searchExists
    index: 'bms'
    type: 'user'
    body:
      query:
        bool:
          should:[
            {term: {username: username}},
            {term: {email: email}}
          ]
          minimum_number_should_match: 1
  .then (data) ->
    console.log data
  .catch (err) ->
    console.log err

module.exports =
  userExistsOrNot: userExistsOrNot