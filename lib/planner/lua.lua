local p = {}

-- Rewrite to include 2 other function "interrupts"

local function fix( s, l )
  local t = s..""
  for i=1,l-#s do t = t.." " end
  return t
end

function p.feDMD( fdish, fmeal, fmeall, fday, fdayy )
  fmeal = fmeal or function() end
  fmeall = fmeall or function() end
  fday = fday or function() end
  fdayy = fdayy or function() end
  for d=1,#p.meals do
    fday( d )
    for m=1,#p.meals[d] do
      fmeal( d, m )
      local meal = p.meals[d][m]
      for h=1,#meal do
        local dish = meal[h]
        fdish( d, m, dish )
      end
      fmeall( d, m )
    end
    fdayy( d )
  end
end

function p.checkMeals()
  p.feDMD(function( day, meal, dish )
    --print(day, meal, dish.name )
  end)
end

local function caloriesIn( v )
  return  v['Protein']*4 +
          v['Fat'] * 9 +
          v['Carbohydrate'] * 4
end

function p.clearT()
  local tally = {}
  local ntrs = require("./lib/db.lua").nutrients
  for i,ntr in pairs(ntrs) do   tally[ntr] = 0   end
  return tally
end

function p.runningT( dn )
  for n, v in pairs( dn ) do 
     p.tally[n] =  p.tally[n] + v
    p.mtally[n] = p.mtally[n] + v
    p.dtally[n] = p.dtally[n] + v
  end
end

function p.eval()
   p.tally = p.clearT()
  p.mtally = p.clearT()
  p.dtally = p.clearT()
  p.feDMD(
    function( day, meal, dish )
      p.runningT( dish.nutrients )
      local info = "c:"..math.floor(caloriesIn( dish.nutrients ))
      print( "    "..fix(dish.meta.name,33)..info )
    end,
    function( day, meal )
      p.mtally = p.clearT()
      print( "  Meal "..meal )
    end,
    function( day, meal )
      print( "  ("..caloriesIn( p.mtally )..")" )
    end,
    function( day )
      print( caloriesIn( p.dtally ) )
      p.dtally = p.clearT()
      print( "\nDay "..day )
    end
  )
  print("\n----  TOTALS  ----")
  print("Calories: "..math.floor(caloriesIn( p.tally ))..
    "/12600")
  --[[
  --]]
  
  -- Then a line in the DB, should be dedicated to the ideal 
  --  consumption for the client
end

return p
