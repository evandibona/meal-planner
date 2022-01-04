-- Pseudocode. 

local plan = require("./lib/planner.lua")

function r( name, params )
  package.loaded['./lib/recipe.lua'] = nil -- force unique obj
  local rec = require("./lib/recipe.lua")
  rec.scale = params[1] or 1
  rec.load( name )
  return rec
end

-- Meal Plan Constructed
-- Leftover in another meta tag. Probably the best option. 
  -- signals a leftover to be pushed to the stack
  -- "leftover" signals one to pop from the stack

plan.meals = {
  {
    { r("salad-cranberry-walnut",{1}) }, 
    { r("steak-cheese-crusted",{1}) }, 
    { r("cauliflower-puree",{1}) }, 
  },
  {
    { r("roast-chicken-skillet",{}) },
  },
  {
    { r("frittata-basic",{}) },
    { r("chicken-lettuce-wraps",{}) },
    { r("soup-parsnip-potato",{}) },
  },
  {
    { r("flank-steak",{}) },
    { r("simple-marinade",{}) },
    { r("acorn-squash-salad-rounds",{}) },
  },
  {
    { r("baked-cod-lemon-garlic",{}) }, 
    { r("bay-scallop-ceviche",{}) },
  },
  {
    { r("swedish-meat-balls",{}) },
    { r("sweet-potato-fries",{}) },
    { r("southern-style-collards",{}) },
  },
  {
    { r("slow-cooker-chicken-soup",{}) },
  },
}

plan.checkMeals()
--plan.calc()
--plan.eval()

-----------------------------
--output meal plan breakdown. 
--generate latex doc 
