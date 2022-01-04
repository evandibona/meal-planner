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

function p.checkMeals()
  p.feDMD(function( day, meal, dish )
    print(day, meal, dish)
  end)
end

local function caloriesIn( v )
  return  v['protein']*4 +
          v['fat'] * 9 +
          v['carbs'] * 4
end

function p.calc()
  p.tally = {}
  p.feDMD(function( day, meal, dish )
    local ntrs = require("./lib/db.lua").nutrients
    for i,ntr in pairs(ntrs) do
      if p.tally[ntr] then
        p.tally[ntr] = p.tally[ntr] + dish.nutrients[ntr]
      else
        p.tally[ntr] = dish.nutrients[ntr]
      end
    end
  end)
end
function p.eval()
  if p.tally==nil then 
    print("ERROR  Calculate nutrients first!")
  end
  print("\n")
  for ntr,v in pairs(p.tally) do
    print("  "..string.upper(string.sub(ntr,1,3))..": ", 
      math.floor(v+0.5))
  end
  print("  Calories:  "..math.floor(caloriesIn(p.tally)+0.5))
end

return p
