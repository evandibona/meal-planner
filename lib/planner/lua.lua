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

function p.eval()

-- load recipes
  p.feDMD(function( day, meal, dish )
      print( dish )
      local recipe = require("./lib/recipe.lua")
      recipe.load( dish )
  end)

        --local recipe = require("./lib/recipe.lua")
        --recipe.load( dish )
        --print( "  Protein: ", recipe.nutrients['protein'] )
        --print( "  Fat: ", "", recipe.nutrients['fat'] )
        --print( "  Carbs: ",   recipe.nutrients['carbs'] )
        --print( "  Calories:", recipe.nutrients['calories'] ) 

end

-- Print Nutrition for Recipe



--set scales
return p
