{expect} = require 'chai'

Feature 'Counting', ->
  Scenario 'Incrementing numbers', ->
    Given 'A number that starts at 0', ->
      @n = 0

    When 'the number is incremented', ->
      @n++

    Then 'it becomes 1', ->
      expect(@n).to.equal 1
