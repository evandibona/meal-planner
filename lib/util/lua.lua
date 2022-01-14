local u = {}

function u.fix( s, l )
  local t = s..""
  for i=1,l-#s do t = t.." " end
  return t
end

function u.standardize( q, ua, ub )
  if ub == "cup" then ub = "cups" end
  if ua == "cup" then ua = "cups" end
  if ua == "lb" then ua = "lbs" end
  if ub == "lb" then ub = "lbs" end
  local t = {}
    t["head of garlic>oz"]  = 1.7
    t["large eggs>oz"]      = 2
    t["scallions>oz"]       = 0.25
    t["onions>onion"]       = 1
    t["cloves>clove"]       = 1
    t["cucumber>oz"] = 7
    t["shallots>oz"] = 0.85
    t["carrots>oz"]  = 2.05
    t["cups>onion"]  = 0.5
    t["sprigs>oz"]   = 0.0282
    t["avocado>g"]   = 102
    t["cloves>oz"]   = 0.176
    t["clove>oz"]    = t['cloves>oz']
    t["yolks>oz"]    = 0.58
    t["onion>oz"]    = 3.8
    t["mango>oz"]    = 4.95
    t["g>leaves"]    = 12
    t["eggs>oz"]     = 2.2
    t["oz>eggs"]     = t["eggs>oz"]
    t["tbs>egg"]     = 1/1.12
    t["ribs>oz"]     = 1.8
    t["oz>egg"]      = t["eggs>oz"]

    t["tsp>dash"]   = 0.2
    t["tsp>g"]      = 0.2
    t["tsp>tbs"]    = 1/3
    t["tsp>oz"]     = 0.1735
    t["tsp>cups"]   = 0.02083
    t["tbs>tsp"]    = 3
    t["tbs>cups"]   = 1/16
    t["tbs>g"]      = 14.79
    t["cups>g"]     = 236.59
    t["cups>oz"]    = 8.33
    t["cups>tbs"]   = 16
    t["cups>tsp"]   = 48
    t["pint>oz"]    = 16.65
    t["pints>cups"] = 2
    t["tbs>oz"]     = 0.52
    t["lbs>g"]      = 453.59
    t["lbs>oz"]     = 16
    t["lbs>tbs"]    = 30.676
    t["oz>cups"]    = 0.12
    t["oz>tbs"]     = 2
    t["oz>g"]       = 28.35
    t["g>tsp"]      = 1/t["tsp>g"]
    t["g>tbs"]      = 0.06763
    t["g>oz"]       = 0.0353

  local r = t[ua..">"..ub]
  if ua == ub then
    return q, ua
  elseif not r then
    print( "ERROR  Couldn't find conversion for: "..ua..">"..ub)
    return 1, "nil"
  else
    return q*r, ub
  end
end


return u
