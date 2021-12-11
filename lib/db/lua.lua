local function trim( s )
  o = ""..s
  if string.sub(s,1,1) == " " then
    s = string.sub(s,(string.find(s,"[%s][%a%d]")or 0)+1,#s)
  end
  return s
end
local function splitRow( str )
  local m = {""}
  for i=1,#str do
    local c = string.sub(str,i,i)
    if c == "," then
      table.insert(m, "")
    else
      m[#m] = m[#m]..c
    end
  end
  for i=1,#m do
    m[i] = trim(m[i])
  end
  return m
end
local function loadCsv(csv)
  local keys = {}
  local ingredients = {}
  for line in io.lines(csv) do 
    if #keys > 1 then
      local traits = splitRow( line )
      local ingredient = {}
      for i=1,#traits do
        ingredient[keys[i]] = traits[i]
      end
      table.insert(ingredients,ingredient)
    else
      keys = splitRow( line )
    end
  end
  table.remove(keys,1) table.remove(keys,1) table.remove(keys,1)
  return ingredients, keys
end

local db = {}
db.ingredients, db.nutrients = loadCsv("recipes/db.csv")

function db.get(ingr)
  for k, v in pairs( db.ingredients ) do
    if v.name == ingr then
      return v
    end
  end
  print("ERROR  Could not find ingredient: "..ingr)
  return nil
end

return db
