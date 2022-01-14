local p = {}
local util = require("./lib/util.lua")

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
      print( "    "..util.fix(dish.meta.name,33)..info )
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
  local function printN( n, g, u )
    local u = u or "g"
    local m = 1
    if u=='mg' then 
      m = 1000
    elseif u == 'mcg' then
      m = 1000000
    end
    local v = math.floor(p.tally[n]*m)
    local g = g or v
    print(util.fix(n..":",32)..
          util.fix(v.."",5).." / "..util.fix(g.." ",7)..u)
  end
  print("\n----  TOTALS  ----")
  print("Calories: "..math.floor(caloriesIn( p.tally ))..
    "/12600")
  printN( 'Protein', 95*7)
  printN( 'Fat', 44*7 )
  printN( 'Carbohydrate', 207*7 )
  printN( 'Sugars', 30*7 )
  printN( 'Fiber', 28*7 )
  printN( 'Vitamin A', 800*7, 'mcg' )
  printN( 'Vitamin B6', 5*7, 'mg' )
  printN( 'Vitamin B12', 3*7, 'mg' )
  printN( 'Vitamin C', 80*7, 'mg' )
  printN( 'Vitamin D', 2.5*7, 'mcg' )
  printN( 'Vitamin K', 150*7, 'mcg' )
  printN( 'Selenium', 285*7, 'mcg' )
  printN( 'Zinc', 10*7, 'mg' )
  printN( 'Copper', 1.5*7, 'mg' )
  printN( 'Iodine', 8*7, 'mg' )
  printN( 'Magnesium', 500*7, 'mg' )
  printN( 'Sodium', 16*7 )
  printN( 'Calcium', 700*7, 'mg' )
  printN( 'Iron', 8*7, 'mg' )
  
  -- Then a line in the DB, should be dedicated to the ideal 
  --  consumption for the client
end

function p.ingredientsByWeek()
  local lists, list = {}, {}
  local x, y = 0, 0
  p.feDMD(
    function( d, m, dish )
      for i=1,#dish.meta.ingredients do
        local ing = dish.meta.ingredients[i]
        local li  = list[ing.name] 
        if li then
          if ing.unit == li[2] then
            li[1] = li[1] + ing.quant
          else
            li[1] = li[1] + 
              util.standardize(ing.quant, ing.unit, li[2])
          end
        else
          list[ing.name] = { ing.quant, ing.unit }
        end
        --print(util.fix(ing.name,44), ing.quant, ing.unit)
      end
    end,
    function() end,
    function() end,
    function( day ) 
      y = math.floor(day/7)
      if x ~= y then 
        table.insert(lists, list)
        print(">>>") 
      end
      x = y
    end
  )
  for i=1,#lists do
    for k, v in pairs(lists[i]) do
      print( util.fix(k, 32), v[1], v[2] )
    end
  end
end

function p.recipesCompiled()
end

function p.nutritionByWeek()
end

function p.scheduleByWeek()
end




return p
