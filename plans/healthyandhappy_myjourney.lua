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
      r("chicken-quinoa-bowls", {1/5}),
      r("balsamic-dressing",    {1/7}) 
    }, 
    {
      r("freezer-burritos", {1.09/7}),
      r("classic-chickpea-hummus", {1.2/5}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1/5}),
      r("balsamic-dressing",    {1/7}) 
    }, 
    {
      r("freezer-burritos", {1.09/7}),
      r("classic-chickpea-hummus", {1.2/5}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1/5}),
      r("balsamic-dressing",    {1/7}) 
    }, 
    {
      r("freezer-burritos", {1.09/7}),
      r("classic-chickpea-hummus", {1.2/5}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1/5}),
      r("balsamic-dressing",    {1/7}) 
    }, 
    {
      r("freezer-burritos", {1.09/7}),
      r("classic-chickpea-hummus", {1.2/5}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Work Day
    {
      r("chicken-quinoa-bowls", {1/5}),
      r("balsamic-dressing",    {1/7}) 
    }, 
    {
      r("freezer-burritos", {1.09/7}),
      r("classic-chickpea-hummus", {1.2/5}),
      r("dipping-veggies", {1}) 
    }, 
  },
  { -- Week 1 Weekend
    { r("romaine-salad",        {1.0}), 
      r("balsamic-dressing",    {1/6}) },
    { r("slow-cooker-char-siu-pork", {0.32}) }
  },
  { -- Week 1 Weekend
    { r("slow-cooker-char-siu-pork", {0.222}) },
    { r("roasted-cauliflower-red-pepper-soup", {0.61}) },
  },
}

--[[
]]

--plan.eval()
--plan.ingredientsByWeek()
print( plan.scheduleTex() )
local recipes = plan.recipesCompiled() 
for n,v in pairs(recipes) do
  --print( v.tex() )
end

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
