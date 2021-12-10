local r = {}
r.meta = ""
r.tex = ""

local function parseMeta( s )
  -- Name: Ingredients: a, b, c
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

function r.load(fn)
  local f = assert(io.open("recipes/"..fn..".tex"))
  r.meta, r.tex = parseRecipe( f:read("*all") )
  f:close()
end

return r
