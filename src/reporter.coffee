mocha = require 'mocha'
Base = mocha.reporters.Base

Spec = (runner) ->
  indent = -> Array(indents).join "  "

  Base.call this, runner

  self = this
  stats = @stats
  indents = 0
  n = 0
  cursor = Base.cursor
  color = Base.color

  runner.on "start", ->
    console.log()

  runner.on "suite", (suite) ->
    ++indents
    console.log color("suite", "%s%s: %s"), 
      indent(), suite.name or '', suite.title

  runner.on "suite end", (suite) ->
    --indents
    console.log()  if 1 is indents

  runner.on "pending", (test) ->
    fmt = indent() + color("pending", "  - %s %s")
    console.log fmt, test.name or '', test.title

  runner.on "pass", (test) ->
    if "fast" is test.speed
      fmt = indent() + 
        color("checkmark", "  " + 
        Base.symbols.ok) + 
        color("bright pass", " %s %s ")
      cursor.CR()
      console.log fmt, test.name or '', test.title
    else
      fmt = indent() + 
        color("checkmark", "  " + Base.symbols.ok) + 
        color("pass", " %s %s ") +
        color(test.speed, "(%dms)")
      cursor.CR()
      console.log fmt, test.name or '', test.title, test.duration

  runner.on "fail", (test, err) ->
    cursor.CR()
    console.log indent() + 
      color("fail", "  %d) %s %s"), ++n, test.name or '', test.title

  runner.on "end", self.epilogue.bind(self)


Spec::__proto__ = Base::

exports = module.exports = Spec
