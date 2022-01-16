local db = require("./lib/db.lua")
local r = {}
r.nutrients = {}
r.meta = ""
r.scale = 1

local function ffr( s )
  if s:find("/") then 
    return ( s:sub(1,s:find("/")-1) / s:sub(s:find("/")+1,#s) )
  else
    return s
  end
end

local function parseMeta( s )
  local m = {}
        m.ingredients = {}
        m.name = s:sub( s:find("section{")+8, s:find("}")-1 )
        m.name = m.name:gsub("\\&", "and")
  s = s:sub( s:find("\\begin{it")+16, s:find("\\end{it")-2 )
  for ln in s:gmatch( "[^\n]*" ) do
    ln = ln:sub(9, #s)
    local qu  = ln:match("<(.*)>")
    local q,u = "",""
    if not qu:find(" ") then
      u = ln:match("> ([^\n,]*)")
      qs= qu
      q = tonumber( ffr(qu) )
    else
      u = qu:match(" (.*)")
      qs= qu:match("[%d/]+")
      q = tonumber( ffr( qu:match("[%d/]+") ) )
    end
    n = ln:match("> ([^,\n]*)")
    u = u:lower()
    local i = {} i.quant, i.quants, i.unit, i.name = q, qs, u, n
    table.insert( m.ingredients, i )
  end
  return m
end

local function parseRecipe(s)
  local m = parseMeta( s )
  local t = s:gsub("<[^\n]*,", "(I)")
        t = t:gsub("<[^\n]*",  "(I)")
  return m, t
end

function r.tex()
  local util = require("./lib/util.lua")
  local i = 0
  local tex = r.template:gsub("%(I%)", function(s)
    i = i + 1
    local ing = r.meta.ingredients[i]
    ing.quants = util.tofrac(ing.quant*r.scale)
    return 
      ing.quants.." "..
      ing.unit.." "..
      (ing.name):lower()..", "
  end)
  tex = "\n\\newpage"..tex:gsub("subsection{", "subsection*{")
  return tex
end

function r.calcNutrition()
  local nutrients = {}
  local util = require("./lib/util.lua")
  for i,ingr in pairs( r.meta.ingredients ) do
    local ding = db.get(ingr.name,r.meta.name)
    local s,u = util.standardize(ingr.quant*r.scale, 
                ingr.unit, ding.unit)
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
  local f = io.open("recipes/"..fn..".tex")
  if f ~= nil then
    r.meta, r.template = parseRecipe( f:read("*all") )
    f:close()
    r.name = fn
    r.nutrients = r.calcNutrition()
  else
    print("ERROR  File does not exist: "..fn)
  end
end

return r
