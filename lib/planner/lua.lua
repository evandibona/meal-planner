local p = {}

function p.feDMD( fx )
  for day=1,#p.meals do
    for m=1,#p.meals[day] do
      local meal = p.meals[day][m]
      for d=1,#meal do
        local dish = meal[d]
        fx( day, meal, dish )
      end
    end
  end
end

local function caloriesIn( v )
  return  v['protein']*4 +
          v['fat'] * 9 +
          v['carbs'] * 4
end

function p.eval()

-- load recipes
  tally = {}
  p.feDMD(function( day, meal, dish )
      print( dish )
      local recipe = require("./lib/recipe.lua")
      local ntrs = require("./lib/db.lua").nutrients
      recipe.load( dish )
        for i,ntr in pairs(ntrs) do
          if tally[ntr] then
            tally[ntr] = tally[ntr] + recipe.nutrients[ntr]
          else
            tally[ntr] = recipe.nutrients[ntr]
          end
        end
  end)
  for ntr,v in pairs(tally) do
    print("  "..string.upper(string.sub(ntr,1,3))..": ", 
      math.floor(v+0.5))
  end
  print("Calories:  "..math.floor(caloriesIn(tally)+0.5))

end

-- Print Nutrition for Recipe



--set scales
return p
