# mocha-cucumber

mocha-cucumber is a UI module for [mocha](https://github.com/mochajs/mocha)
that allows you to describe your features using Given/When/Then!

## Installing

You should first have mocha installed:
```
npm install -g mocha
```

Then install mocha-cucumber, either globally or inside your project:
```
npm install -g mocha-cucumber
```


## Usage

Write your feature(s): 

```
{expect} = require 'chai'

Feature 'Math', ->
  Scenario 'Incrementing numbers', ->
    Given 'A number that starts at 0', ->
      @n = 0

    When 'the number is incremented', ->
      @n++

    Then 'it becomes 1', ->
      expect(@n).to.equal 1
```

Or if you prefer plan ole js:
```
var expect = require('chai').expect;

Feature('Math', function() {
  Scenario('Incrementing numbers', function() {
    Given('A number that starts at 0', function() {
      this.n = 0;
    });
    When('the number is incremented', function() {
      this.n++;
    });
    Then('it becomes 1', function() {
      expect(this.n).to.equal(1);
    });
  });
});
```

Then run mocha:
```
mocha --ui mocha-cucumber test/*
```

And you get:
![Example output](https://raw.github.com/zeevl/mocha-cucumber/master/example.png)

### What's going on?

mocha-cucumber aliases `Scenario` and `Feature` as alieses to mocha's 
exising `describe`, and `Given`/`When`/`Then`/`And`/`But` as aliases to mocha's 
`it` BDD methods.   

`describe` and `it` still work as usual, so you can combine your cucumber features
with BDD specs and it will Just Work(tm). 

### Contributing

Feel free to submit issues and/or PRs!  In lieu of a formal style guide, 
please follow existing styles.




