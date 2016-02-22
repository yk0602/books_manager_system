usersModel = require '../models/usersModel'
should = require 'should'

describe 'usersModel', () ->
  describe 'test userExistsOrNot', () ->
    it 'should return true', () ->
      usersModel.userExistsOrNot 'yk', 'xx'
      .then (data) ->
        data.should.be.equal null