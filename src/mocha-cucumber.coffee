mocha = require 'mocha'
reporter = require './reporter'

module.exports = (suite) ->
  mocha.interfaces.bdd suite
 
  suite.on "pre-require", (context, file, mocha) ->
    for clause in ['Feature', 'Scenario'] 
      do (clause) ->
        context[clause] = (title, fn) ->
          suite = context.describe title, fn
          suite.name = clause
          return suite

    for clause in ['Given', 'When', 'Then', 'And', 'But'] 
      do (clause) ->
        context[clause] = (title, fn) ->
          test = context.it title, fn
          test.name = clause
          return test

    mocha.reporter reporter