local list = require("list")
require("unit")

local suite = Unit.suite("List", {
  Unit.test("fold takes a function and state and returns a function that flattens a list", function()
    local add = function (x, y) return x + y end
    local sum = list.fold(add, 0)
    local myFavoriteNumbers = {
      69,
      420,
      42,
      1337
    }
    return(sum(myFavoriteNumbers) == 1868)
  end),

  Unit.test("map takes a function and returns a function that applies that function to each member of a given list", function()
    local inc = function (x) return x + 1 end
    local incrementList = list.map(inc)
    local initial = {1, 2, 3}
    local expected = {2, 3, 4}
    return Unit.deepEquals(incrementList(initial),expected)
  end),

  Unit.test("filter takes a unary function that returns a boolean and returns a function that takes a list and returns a new list with entries that return true for the original function.", function()
    local isFoo = function (n) return "foo" == n end
    local words = {
      "foo",
      "bar",
      "baz",
      "bip",
      "bop",
      "wop",
      "nop",
      "nap",
      "lap",
      "foo"
    }
    local keepTheFoo = list.filter(isFoo)
  
    local allFoo = {"foo", "foo"}
    
    return Unit.deepEquals(keepTheFoo(words),allFoo)
  end)


})

Unit.report(suite)