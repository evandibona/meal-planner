-- Pseudocode. 

local plan = require("./lib/planner.lua")

function r( name, params )
  package.loaded['./lib/recipe.lua'] = nil -- force unique obj
  local rec = require("./lib/recipe.lua")
  rec.scale = params[1]
  rec.load( name )
  return rec
end

-- Meal Plan Constructed
plan.meals = {
  {
    { r("soup-carrot-leek",{11/24}) }, 
    { 
      r("pan-ribeye",{1.6}),
      r("sauteed-cabbage",{1})
    }, 
  }
}

plan.calc()
plan.eval()

--output meal plan breakdown. 
--generate latex doc 
