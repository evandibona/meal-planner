-- Pseudocode. 

local plan = require("./lib/planner.lua")
plan.span = 1


--place recipes into slots
plan.meals = {
  "soup-carrot-leek",
  "steak-dinner-one"
}

-- load recipes
for i=1,#plan.meals do
  local recipe = require("./lib/recipe.lua")
  recipe.load(plan.meals[i])
  recipe.nutrition()
end

-- Print Nutrition for Recipe



--set scales
--output meal plan breakdown. 
--generate latex doc 
