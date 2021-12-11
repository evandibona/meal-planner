-- Pseudocode. 

local plan = require("./lib/planner.lua")

-- Meal Plan Constructed
plan.meals = {
  {
    { "soup-carrot-leek" }, 
    { 
      "pan-ribeye",
      "roasted-potatoes",
      "sauteed-cabbage"
    }, 
  }
}

plan.eval()

--output meal plan breakdown. 
--generate latex doc 
