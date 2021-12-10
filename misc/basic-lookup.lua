-- all macros are in grams. 
-- could also include fiber down the road
-- EVOO, Banana, Duck Egg
db = 
{
  { 
		 n = 'Duck Egg', 
		 s=1,u='egg', 
		 cal = 130, 
		 pro = 9.64, 
		 fat = 1.02, 
		 crb = 8.97, 
	},
	{
		 n = 'Banana',
		 s=1,u='oz',
		 cal = 16,
		 pro = 0.06,
		 fat = 4.11,
		 crb = 0.2,
	}, 
	{
		 n = 'EVOO',
		 s=1,u='tbsp',
		 cal = 120,
		 pro = 14,
		 fat = 0,
		 crb = 0,
	},
  {
    n='Ghee',
    s=1,u='tbs',
    cal = 112, 
    pro = 0, 
    fat = 13, 
    crb = 0,
  },
  {
    n='Leeks',
    s=1,u='oz',
    cal = 17, 
    pro = 0.43, 
    fat = 0.09, 
    crb = 4.01,
  },
  {
    n='Celery',
    s=1,u='oz',
    cal = 4, 
    pro = 0.2, 
    fat = 0.05, 
    crb = 0.84,
  },
  {
    n='Carrots',
    s=1,u='oz',
    cal = 10, 
    pro = 0.23, 
    fat = 0.06, 
    crb = 2.4,
  },
  {
    n='Chicken Broth',
    s=1,u='cup',
    cal = 86, 
    pro = 6.05, 
    fat = 2.88, 
    crb = 8.47,
  },
  {
    n='Sour Cream',
    s=2,u='tbs',
    cal = 60, 
    pro = 1, 
    fat = 5, 
    crb = 1,
  },
  {
    n='Ribeye Steak',
    s=1,u='oz',
    cal = 63.75, 
    pro = 5, 
    fat = 4.875, 
    crb = 0,
  },
  {
    n='Yukon Gold Potato',
    s=1,u='oz',
    cal = 26.2, 
    pro = 0.7, 
    fat = 0, 
    crb = 5.9,
  },
  {
    n='Green Cabbage',
    s=1,u='oz',
    cal = 6, 
    pro = 0.33, 
    fat = 0.03, 
    crb = 1.28,
  },
  {
    n='Butter',
    s=1,u='tbs',
    cal = 100, 
    pro = 0, 
    fat = 12, 
    crb = 0,
  },
}

-- Assuming middle aged man, average height. 160 lbs
-- sedentary with some exercise.Lower carbs
-- Daily goal, 1935 calories, 170g protein, 65g fat, 168g carbs.
-- 4/7 for meal 2 3/7 for meal 1 
-- 1106 meal 2, 829 for meal 1

-- function for conversions
--   one for weight, one for volume
--   and one to unify them and validate input.  
-- On top of that build a normalizer. 
-- implement these all as a prototype object. 

-- I want a steak dinner of 1100 calories
-- 8oz steak, 1 knob of butter, 2 ounces of cabbage, 2 oz potato
-- 510, 100, 24, 52 = 686 calories, 1106/686 for multiplier,
-- x=1.612 --> 
--  12.8oz Steak, 1.6 tbsp butter, 3.2 oz cabbage, 3.2 oz tater

--- Function I need. 
 -- scale recipe. 
 --   adjust in order of ingredients listed to get desired
 --   amounts of macronutrients

mealA = {"Chicken Broth","Sour Cream",'Carrots','Celery', 'Leeks', 'Ghee'}
mealB = { "Ribeye Steak", "Butter", "Green Cabbage", "Yukon Gold Potato" }

function grabIngredient(name)
  for i=1,#db do
    if db[i].n == name then 
      return db[i]
    end
  end
end

function cmp(la, lb)
  if #la == #lb then
    for i=1,#la do
      if la[i] ~= lb[i] then
        return false
      end
    end
    return true
  else
    return false
  end
end

function copytable(t)
  local n = {}
  for i=1,#t do
    table.insert(n, t[i])
  end return n
end

function bubbleSortBy(list, attr)
  local function pass( l, a )
    l = copytable(l) 
    for i=1,#l-1 do
      local x, y = l[i], l[i+1]
      if grabIngredient(x)[a] < grabIngredient(y)[a] then
        l[i]   = y
        l[i+1] = x
      else
      end
    end
    return l
  end
  local ol = list
  local nl = pass(list, attr)
  while not cmp(ol, nl) do
    ol, nl = nl, pass( nl, attr )
  end

  for j=1,#nl do
    print( nl[j], grabIngredient(nl[j])[attr], "", 
           ol[j], grabIngredient(ol[j])[attr] )
  end
end

print("\n","   ---   FAT   ---")
bubbleSortBy( mealA, 'fat' )
print("\n","   ---   PROTEIN   ---")
bubbleSortBy( mealA, 'pro' )
print("\n","   ---   CARBS   ---")
bubbleSortBy( mealA, 'crb' )
print("\n","   ---   CALORIES   ---")
bubbleSortBy( mealA, 'cal' )

