-- Pseudocode. 

local plan = require("./lib/planner.lua")

function r( name, params )
  package.loaded['./lib/recipe.lua'] = nil -- force unique obj
  local rec = require("./lib/recipe.lua")
  rec.scale = params[1] or 1
  rec.load( name )
  return rec
end

plan.meals = {
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1}),
      r("balsamic-dressing", {1}) 
    }, 
    {
      r("freezer-burritos", {1}),
      r("classic-chickpea-hummus", {1}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1}),
      r("balsamic-dressing", {1}) 
    }, 
    {
      r("freezer-burritos", {1}),
      r("classic-chickpea-hummus", {1}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1}),
      r("balsamic-dressing", {1}) 
    }, 
    {
      r("freezer-burritos", {1}),
      r("classic-chickpea-hummus", {1}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1}),
      r("balsamic-dressing", {1}) 
    }, 
    {
      r("freezer-burritos", {1}),
      r("classic-chickpea-hummus", {1}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1}),
      r("balsamic-dressing", {1}) 
    }, 
    {
      r("freezer-burritos", {1}),
      r("classic-chickpea-hummus", {1}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Weekend
    { r("romaine-salad", {1}) },
    { r("slow-cooker-char-siu-pork", {1}) }
  },
  { -- Week 1 Weekend
    { r("slow-cooker-char-siu-pork", {1}) },
    { r("roasted-cauliflower-red-pepper-soup", {1}) },
  },
}

--[[
]]

--plan.eval()
plan.ingredientsByWeek()
--[[
tex.wet( 
  {
    template = "template.tex",
    shoppingList =    plan.ingredientsByWeek(), 
    recipes =         plan.recipesCompiled(), 
    weeklyReport =    plan.nutritionByWeek(),
    weeklySchedule =  plan.scheduleByWeek()
  }, 
  "/home/evan/downloads/blank.tex" )
--]]

-----------------------------
--output meal plan breakdown. 
--generate latex doc 
