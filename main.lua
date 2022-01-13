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
    { r("salad-cranberry-walnut", {1}) }, 
    { 
      r("steak-cheese-crusted",   {0.5}), 
      r("cauliflower-puree",      {0.5}) 
    }, 
  },
  {
    { r("roast-chicken-skillet",  {1.1}) },
  },
  {
    { r("frittata-basic",         {1}) },
    { 
      r("chicken-lettuce-wraps",  {0.35}) 
    },
  },
  {
    { 
      r("flank-steak",            {0.70}), 
      r("simple-marinade",        {0.05}), 
      r("acorn-squash-salad-rounds",{0.20})
    },
    { 
      r("soup-parsnip-potato",    {1.2})
    },
  },
  {
    { r("bay-scallop-ceviche",    {}) },
    { r("baked-cod-lemon-garlic", {0.75}) }, 
  },
  {
    { r("swedish-meat-balls",     {0.25}), 
      r("sweet-potato-fries",     {0.5}), 
      r("southern-style-collards",{0.125})
    },
  },
  {
    { r("slow-cooker-chicken-soup",{0.25}) },
  },
}

plan.eval()
--[[
tex.wet( 
  {
    template = "template.tex",
    shoppingList = plan.ingredientsByWeek(), 
    recipes = plan.recipesCompiled(), 
    weeklyReport = plan.nutritionByWeek(),
    weeklySchedule = plan.scheduleByWeek()
  }, 
  "/home/evan/downloads/blank.tex" )
--]]

-----------------------------
--output meal plan breakdown. 
--generate latex doc 
