elasticsearch = require 'elasticsearch'
es_client = new elasticsearch.Client
  host: 'localhost:9200'
  log: 'trace'

es_client.ping
  requestTimeout: 5000
  hello: 'hello elasticsearch!'
.then () ->
  console.log 'elasticsearch startup successful!'
.catch (err) ->
  console.log console.log 'elasticsearch cluster is down!'

module.exports = es_client