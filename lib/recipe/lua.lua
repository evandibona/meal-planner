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
  local lookup = {}
    lookup["cups>tbs"] = 16
    lookup["lbs>oz"]   = 16
    lookup["tbs>cups"] = 1/16
    lookup["tsp>tbs"]  = 1/3
  local r = lookup[ua..">"..ub]
  if ua == ub then
    return q, ua
  elseif not r then
    print("ERROR  Couldn't find conversion for: "..ua..">"..ub,
      "\n")
    return nil
  else
    return q*r, ub
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
      local quant = string.sub(ln,string.find(ln,", ")+2,#ln)
      table.insert(m.ingr,{
        string.sub(ln,3, string.find(ln,",")-1),
        string.sub(quant,1,string.find(quant," ")-1), 
        string.sub(quant,string.find(quant," ")+1,#quant)
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
    local s,u = standardize(ingr[2]*r.scale, ingr[3], ding.unit)
    for j,nutr in pairs( db.nutrients ) do
      if nutrients[nutr] then
        nutrients[nutr] = nutrients[nutr] + s*ding[nutr]
      else
        nutrients[nutr] = s*ding[nutr]
      end
    end
  end
  return nutrients
end

function r.load(fn)
  local f = assert(io.open("recipes/"..fn..".tex"))
  r.meta, r.tex = parseRecipe( f:read("*all") )
  f:close()
  r.name = fn
  r.nutrients = r.calcNutrition()
end

return r
