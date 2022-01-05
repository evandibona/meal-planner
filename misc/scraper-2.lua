local attrs = { "name", "serving", "unit", "protein", "fat", "carbs", "Sodium", "Sugars" }

local s = {}

s["Placeholder"]="nil"
s["Acorn Squash"]="https://www.fatsecret.com/calories-nutrition/usda/acorn-winter-squash?portionid=44340&portionamount=1.000"
s["ACV"]="https://www.fatsecret.com/calories-nutrition/bragg/organic-apple-cider-vinegar"
s["Allspice"]="https://www.fatsecret.com/calories-nutrition/usda/allspice-ground?portionid=41984&portionamount=1.000"
s["Avocado Oil"]="https://www.fatsecret.com/calories-nutrition/simply-nature/100-pure-avocado-oil"
s["Banana"]="https://www.fatsecret.com/calories-nutrition/usda/bananas?portionid=43674&portionamount=1.000"
s["Bay Leaves"]="https://www.fatsecret.com/calories-nutrition/tones/bay-leaves"
s["Beef Broth"]="https://www.fatsecret.com/calories-nutrition/generic/beef-broth-without-tomato-home-recipe?portionid=10957&portionamount=1.000"
s["Bibb Lettuce"]="https://www.fatsecret.com/calories-nutrition/usda/butterhead-lettuce-(includes-boston-and-bibb-types)?portionid=44157&portionamount=1.000"
s["Black Pepper"]="https://www.fatsecret.com/calories-nutrition/usda/black-pepper?portionid=42013&portionamount=1.000"
s["Chicken Stock"]="https://www.fatsecret.com/calories-nutrition/pacific-natural-foods/organic-chicken-bone-broth"
s["Butter"]="https://www.fatsecret.com/calories-nutrition/kerrygold/unsalted-pure-irish-butter"
s["Carrots"]="https://www.fatsecret.com/calories-nutrition/generic/carrots-raw?portionid=21981&portionamount=1.000"
s["Cauliflower"]="https://www.fatsecret.com/calories-nutrition/usda/cauliflower?portionid=44072&portionamount=1.000"
s["Celery"]="https://www.fatsecret.com/calories-nutrition/usda/celery?portionid=44078&portionamount=1.000"
s["Chicken Broth"]="https://www.fatsecret.com/calories-nutrition/generic/chicken-broth-without-tomato-home-recipe"
s["Chicken Thigh"]="https://www.fatsecret.com/calories-nutrition/generic/chicken-thigh-ns-as-to-skin-eaten?portionid=4674&portionamount=1.000"
s["Chuck"]="https://www.fatsecret.com/calories-nutrition/usda/beef-chuck-(mock-tender-steak-trimmed-to-1-4-fat)?portionid=41259&portionamount=1.000"
s["Cilantro"]="https://www.fatsecret.com/calories-nutrition/generic/cilantro-raw?portionid=183724&portionamount=1.000"
s["Cod Filet"]="https://www.fatsecret.com/calories-nutrition/blue-sea/cod-fillet"
s["Collard Greens"]="https://www.fatsecret.com/calories-nutrition/usda/collards?portionid=44092&portionamount=1.000"
s["Cucumber"]="https://www.fatsecret.com/calories-nutrition/usda/cucumber-(peeled)?portionid=44122&portionamount=1.000"
s["Dijon Mustard"]="https://www.fatsecret.com/calories-nutrition/grey-poupon/dijon-mustard"
s["Double Cream"]="https://www.fatsecret.com/calories-nutrition/devon-cream-company/english-double-cream"
s["Dried Basil"]="https://www.fatsecret.com/calories-nutrition/usda/basil-(dried)?portionid=41986&portionamount=1.000"
s["Dried Oregano"]="https://www.fatsecret.com/calories-nutrition/usda/oregano?portionid=42010&portionamount=1.000"
s["Duck Egg"]="https://www.fatsecret.com/calories-nutrition/usda/duck-egg"
s["EVOO"]="https://www.fatsecret.com/calories-nutrition/vigo/extra-virgin-olive-oil"
s["Egg Yolks"]="https://www.fatsecret.com/calories-nutrition/usda/egg-yolk?portionid=41931&portionamount=1.000"
s["Feta Cheese"]="https://www.fatsecret.com/calories-nutrition/usda/feta-cheese"
s["Filet Mignon"]="https://www.fatsecret.com/calories-nutrition/trader-joes/beef-filet-mignon"
s["Fish Sauce"]="https://www.fatsecret.com/calories-nutrition/viet-huong/fish-sauce"
s["Flank Steak"]="https://www.fatsecret.com/calories-nutrition/trader-joes/premium-black-angus-beef-flank-steak"
s["Parsley"]="https://www.fatsecret.com/calories-nutrition/generic/parsley-raw?portionid=183733&portionamount=1.000"
s["Thyme"]="https://www.fatsecret.com/calories-nutrition/usda/thyme?portionid=42031&portionamount=1.000"
s["Garlic"]="https://www.fatsecret.com/calories-nutrition/usda/garlic?portionid=44128&portionamount=1.000"
s["Garlic Powder"]="https://www.fatsecret.com/calories-nutrition/usda/garlic-powder?portionid=29595&portionamount=1.000"
s["Ghee"]="https://www.fatsecret.com/calories-nutrition/ancient-organics/ghee"
s["Green Cabbage"]="https://www.fatsecret.com/calories-nutrition/generic/cabbage-green-raw?portionid=24607&portionamount=1.000"
s["Ham Hock"]="https://www.fatsecret.com/calories-nutrition/nebraska-meat-corporation/smoked-pork-hocks"
s["Heavy Cream"]="https://www.fatsecret.com/calories-nutrition/generic/cream-heavy-fluid?portionid=606&portionamount=1.000"
s["Honey"]="https://www.fatsecret.com/calories-nutrition/usda/honey?portionid=40061&portionamount=1.000"
s["Large Egg"]="https://www.fatsecret.com/calories-nutrition/kroger/eggs-(large)"
s["Leeks"]="https://www.fatsecret.com/calories-nutrition/generic/leek-raw?portionid=183729&portionamount=1.000"
s["Lemon Juice"]="https://www.fatsecret.com/calories-nutrition/usda/lemon-juice?portionid=33132&portionamount=1.000"
s["Lime Juice"]="https://www.fatsecret.com/calories-nutrition/usda/lime-juice?portionid=33146&portionamount=1.000"
s["Maifun Rice Noodles"]="https://www.fatsecret.com/calories-nutrition/annie-chuns/maifun-rice-noodles"
s["Mango"]="https://www.fatsecret.com/calories-nutrition/usda/mangos?portionid=43782&portionamount=1.000"
s["Maple Spice Blend"]="https://www.fatsecret.com/calories-nutrition/generic/sugar-maple?portionid=55857&portionamount=100.000"
s["Milk"]="https://www.fatsecret.com/calories-nutrition/generic/milk-cows-fluid-whole"
s["Mirin"]="https://www.fatsecret.com/calories-nutrition/mitsukan/mirin"
s["Mixed Greens"]="https://www.fatsecret.com/calories-nutrition/generic/mixed-salad-greens-raw?portionid=183732&portionamount=1.000"
s["Mixed Vegetables"]="https://www.fatsecret.com/calories-nutrition/freshlike/mixed-vegetables"
s["Nutmeg"]="https://www.fatsecret.com/calories-nutrition/usda/nutmeg-(ground)"
s["Orange Juice"]="https://www.fatsecret.com/calories-nutrition/usda/orange-juice"
s["Orange Zest"]="https://www.fatsecret.com/calories-nutrition/usda/orange-peel?portionid=33232&portionamount=1.000"
s["Panko Bread Crumbs"]="https://www.fatsecret.com/calories-nutrition/wegmans/panko-bread-crumbs"
s["Paprika"]="https://www.fatsecret.com/calories-nutrition/usda/paprika?portionid=29610&portionamount=1.000"
s["Parmesan Cheese"]="https://www.fatsecret.com/calories-nutrition/usda/parmesan-cheese-(hard)"
s["Parsnip"]="https://www.fatsecret.com/calories-nutrition/usda/parsnips?portionid=44203&portionamount=1.000"
s["Peanuts"]="https://www.fatsecret.com/calories-nutrition/generic/peanuts?portionid=10059&portionamount=1.000"
s["Peppercorns"]="https://www.fatsecret.com/calories-nutrition/spice-islands/100%25-organic-black-peppercorns"
s["Poblano Pepper"]="https://www.fatsecret.com/calories-nutrition/generic/pepper-poblano-raw?portionid=21956&portionamount=1.000"
s["Pork"]="https://www.fatsecret.com/calories-nutrition/usda/ground-pork?portionid=33833&portionamount=1.000"
s["Raw Pumpkin Seeds"]="https://www.fatsecret.com/calories-nutrition/natural-grocers/organic-raw-pumpkin-seeds"
s["Red Onion"]="https://www.fatsecret.com/calories-nutrition/generic/onions-red?portionid=340032&portionamount=1.000"
s["Red Wine Vinegar"]="https://www.fatsecret.com/calories-nutrition/pompeian/red-wine-vinegar"
s["Ribeye Steak"]="https://www.fatsecret.com/calories-nutrition/kirkland-signature/ribeye-steak"
s["Rosemary"]="https://www.fatsecret.com/calories-nutrition/usda/rosemary?portionid=42038&portionamount=1.000"
s["Russet Potato"]="https://www.fatsecret.com/calories-nutrition/generic/white-potato-baked-peel-not-eaten?portionid=20749&portionamount=1.000"
s["Salt"]="https://www.fatsecret.com/calories-nutrition/usda/salt"
s["Scallions"]="https://www.fatsecret.com/calories-nutrition/usda/scallions-or-spring-onions?portionid=44196&portionamount=1.000"
s["Shallots"]="https://www.fatsecret.com/calories-nutrition/usda/shallots?portionid=44469&portionamount=1.000"
s["Sour Cream"]="https://www.fatsecret.com/calories-nutrition/generic/sour-cream?portionid=1621&portionamount=1.000"
s["Sourdough Bread"]="https://www.fatsecret.com/calories-nutrition/generic/bread-sour-dough?portionid=181626&portionamount=1.000"
s["Soy Sauce"]="https://www.fatsecret.com/calories-nutrition/generic/soy-sauce?portionid=12271&portionamount=1.000"
s["Sugar"]="https://www.fatsecret.com/calories-nutrition/florida-crystals/natural-cane-sugar"
s["Sweet Potato"]="https://www.fatsecret.com/calories-nutrition/usda/sweet-potato?portionid=44362&portionamount=1.000"
s["Tiny Bay Scallops"]="https://www.fatsecret.com/calories-nutrition/generic/scallops-cooked?portionid=8888&portionamount=1.000"
s["Tomatoes"]="https://www.fatsecret.com/calories-nutrition/generic/tomatoes-raw?portionid=23497&portionamount=1.000"
s["Vegetable Stock"]="https://www.fatsecret.com/calories-nutrition/kitchen-basics/natural-vegetable-cooking-stock"
s["Vidalia Onion"]="https://www.fatsecret.com/calories-nutrition/real-sweet/vidalia-onion"
s["Wheat Flour"]="https://www.fatsecret.com/calories-nutrition/generic/flour-whole-wheat?portionid=11807&portionamount=1.000"
s["White Onion"]="https://www.fatsecret.com/calories-nutrition/generic/onions-mature-raw?portionid=23347&portionamount=1.000"
s["Chicken"]="https://www.fatsecret.com/calories-nutrition/perdue/ground-chicken"
s["Yellow Onion"]="https://www.fatsecret.com/calories-nutrition/food-lion/yellow-onions"
s["Yukon Gold Potato"]="https://www.fatsecret.com/calories-nutrition/publix/yukon-gold-potatoes"
--[[
--]]

local function split( st, sp ) 
  sp = sp or " "
  return st:sub(1,st:find(sp)-1), st:sub(st:find(sp)+1,#st) 
end

local function pickPortion( p )
  local a = p:sub(1,             p:find("%(")-2)
  local b = p:sub(p:find("%(")+1,p:find("%)")-1)
  return { a, b }
end

local function scrapeData( file )
  local gumbo = require "gumbo"
  local doc = gumbo.parseFile( file, { tabStop = 2 } )
  local nf = doc:getElementsByClassName('factPanel')[1]

  local function cl( n, c )
    return n:getElementsByClassName( c )
  end
  local function fcl( n, c )
    return cl( n, c )[1]
  end
  local function fcltxt( n, c )
    return cl( n, c )[1].textContent
  end

  

  -- Grabbing Elements
  local d = {}
  d.size = fcltxt(nf, 'serving_size_value')
  local l = ""

  for node in nf:walk() do
    local ntxt = node.textContent
    local ncl  = node.className
    if ncl then
      if ncl:find("nutrient") then
        if ncl:find("value") then
          d[ l ] = ntxt
        else
          l = ntxt
        end
      end
    end
  end

  -- Refining Data

  local tfat = 0
  local dd = {}
  for l, v in pairs( d ) do
    if v=='-' then v = "0g" end
    if (not l:find("Quantity")) and (not l:find("Unit")) and
       (not l:find("Total Fat")) then
      local q, u = v:match("[%d%.]+"), v:match("%a+")
      q = tonumber( q )
      if     u == 'mg' then v = q / 1000  
      elseif u =='mcg' then v = q / 1000000
      else v = q  end
      if l:find("Fat") then tfat = tfat + v end
      dd[l] = v
    end
  end

  dd['Total Fat']           = tfat
  if d.size:find("%(") then
    dd["Quantity"], dd["Unit"] = split( pickPortion(d.size)[1] )
  else
    dd["Quantity"], dd["Unit"] = split( d.size )
  end

  return dd
end

print( "Name, Quantity, Unit, Protein, Fat, Carbohydrate, "..
  "Sugars, Dietary Fiber, Cholesterol, Sodium, Potassium, "..
  "Calcium, Iron, Vitamin A, Vitamin C, Vitamin D" )

for o, u in pairs(s) do
  if u ~= "nil" then
    os.execute("wget -T 3 -O scraped.html "..u.."; sleep 1.5")
    local ingr = scrapeData("scraped.html")

    local ln = o
    local lbs = {
      'Quantity',
      "Unit",
      "Protein",
      "Total Fat",
      "Total Carbohydrate",
      "Sugars",
      "Dietary Fiber",
      "Cholesterol",
      "Sodium",
      "Potassium",
      "Calcium",
      "Iron",
      "Vitamin A",
      "Vitamin C",
      "Vitamin D"
    }
    for i=1,#lbs do
      local label = lbs[i]
      if not ingr[label] then ingr[label] = 0 end
      ln = ln..", "..ingr[label]
    end
    print(ln)
  end
end

-- Append Into CSV File

