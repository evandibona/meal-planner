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
    print(fix(n..":",32)..
          fix(v.."",5).." / "..fix(g.." ",7)..u)
  end
  print("\n----  TOTALS  ----")
  print("Calories: "..math.floor(caloriesIn( p.tally ))..
    "/12600")
  printN( 'Protein', 98*7)
  printN( 'Fat', 46*7 )
  printN( 'Carbohydrate', 214*7 )
  printN( 'Sugars', 9*7 )
  printN( 'Fiber', 31*7 )
  printN( 'Vitamin A', 950*7, 'mcg' )
  printN( 'Vitamin B6', 5*7, 'mg' )
  printN( 'Vitamin B12', 3*7, 'mg' )
  printN( 'Vitamin C', 100*7, 'mg' )
  printN( 'Vitamin D', 4*7, 'mcg' )
  printN( 'Vitamin K', 275*7, 'mcg' )
  printN( 'Selenium', 285*7, 'mcg' )
  printN( 'Zinc', 10*7, 'mg' )
  printN( 'Copper', 2*7, 'mg' )
  printN( 'Iodine', 8.25*7, 'mg' )
  printN( 'Magnesium', 500*7, 'mg' )
  printN( 'Sodium', 16*7 )
  printN( 'Calcium', .850*7 )
  printN( 'Iron', 8*7, 'mg' )
  
  -- Then a line in the DB, should be dedicated to the ideal 
  --  consumption for the client
end

return p
