local db = require("./lib/db.lua")
local r = {}
r.nutrients = {}
r.meta = ""
r.tex = ""
r.scale = 1

local function standardize( q, ua, ub )
  if ub == "cup" then ub = "cups" end
  if ua == "cup" then ua = "cups" end
  if ua == "lb" then ua = "lbs" end
  if ub == "lb" then ub = "lbs" end
  local t = {}
    t["head of garlic>oz"] = 1.7
    t["onions>onion"]      = 1
    t["shallots>oz"] = 0.85
    t["carrots>oz"]  = 2.05
    t["cloves>oz"]   = 0.16
    t["yolks>oz"]    = 0.58
    t["sprigs>oz"]   = 0.0282
    t["onion>oz"]    = 3.8
    t["g>leaves"]    = 12
    t["eggs>oz"]     = 2.2
    t["oz>eggs"]     = t["eggs>oz"]
    t["oz>egg"]      = t["eggs>oz"]
    t["tbs>egg"]     = 1/1.12
    t["ribs>oz"]     = 1.8

    t["tsp>dash"]   = 0.2
    t["tsp>g"]      = 0.2
    t["tsp>tbs"]    = 1/3
    t["tsp>oz"]     = 0.1735
    t["tsp>cups"]   = 0.02083
    t["tbs>tsp"]    = 3
    t["tbs>cups"]   = 1/16
    t["cups>oz"]    = 8.33
    t["cups>tbs"]   = 16
    t["cups>tsp"]   = 48
    t["pint>oz"]    = 16.65
    t["pints>cups"] = 2
    t["tbs>oz"]     = 0.52
    t["lbs>oz"]     = 16
    t["oz>tbs"]     = 2
    t["oz>g"]       = 28.35
    t["g>tsp"]      = 1/t["tsp>g"]
    t["g>oz"]       = 0.0353

  local r = t[ua..">"..ub]
  if ua == ub then
    return q, ua
  elseif not r then
    print("ERROR  Couldn't find conversion for: "..ua..">"..ub)
    return 1, "nil"
  else
    return q*r, ub
  end
end

local function fr( s )
  if s:find("/") then 
    return ( s:sub(1,s:find("/")-1) / s:sub(s:find("/")+1,#s) )
  else
    return s
  end
end

local function parseMeta( s )
  local m = {}
  m.ingr  = {}
  local i = 0
  for ln in string.gmatch(s, "[^\n]+") do
    i = i + 1  
    if i == 1 then 
      m.name = ln 
    else
      local quant = ln:sub(ln:find(", ")+2,#ln)
      local qty = quant:sub(1,quant:find(" ")-1)
      table.insert(m.ingr,{
        ln:sub(3,ln:find(",")-1),
        fr( qty ),
        quant:sub(quant:find(" ")+1,#quant)
      })
    end
  end
  return m
end

local function parseRecipe(s)
  m = string.sub(s,1,string.find(s,'%%+')-1)
  t = string.sub(s,string.find(s,'%%\n')+1,#s)
  m = parseMeta(m)
  return m, t
end

function r.calcNutrition()
  local nutrients = {}
  for i,ingr in pairs( r.meta.ingr ) do
    local ding = db.get(ingr[1])
    --io.write(">>> ")
    --io.write(ingr[1].."\t"..ingr[2].."|"..ingr[3])
    local s,u = standardize(ingr[2]*r.scale, ingr[3], ding.unit)
      s = tonumber(s)/ding.quantity
    for j,nutr in pairs( db.nutrients ) do
      --io.write(" *"..ding[nutr])
      if nutrients[nutr] then
        nutrients[nutr] = nutrients[nutr] + s*ding[nutr]
      else
        nutrients[nutr] = s*ding[nutr]
      end
    end
    --io.write("\n")
  end
  return nutrients
end

function r.load(fn)
  ---print("","---   "..fn.."   ---")
  local f = assert(io.open("recipes/"..fn..".tex"))
  r.meta, r.tex = parseRecipe( f:read("*all") )
  f:close()
  r.name = fn
  r.nutrients = r.calcNutrition()
end

return r
