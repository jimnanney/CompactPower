function cp_recipe_factory(name, tier, extra_ingredient)
  if ((tier < 2) or (tier > 5)) then
    error("Invalid tier “"..tier.."” passed to cp_recipe_factory()")
  else
		local ingredient = {
            {tiered_name(name, tier - 1), math.ceil(tier_multiplier)},
            {"copper-cable", math.ceil(tier_multiplier) },
            extra_ingredient
        }
		if tier == 5 then
		table.insert(ingredient,{"processing-unit", extra_ingredient[2]})
		end
    return {
        type = "recipe",
        name = tiered_name(name, tier),
        energy_required = 10*tier,
        enabled = "false",
        ingredients = ingredient,
        result = tiered_name(name, tier)
    }
  end
end
local prices = {
["electronic-circuit"] = 0.75,
["advanced-circuit"] = 3.2,
["processing-unit"] = 22.6,
["space-science-pack"] = 82.3,
["solar-panel"] = 34.8,
["accumulator"] = 15.6,
}
local tier_ingredients = {
"electronic-circuit",
"advanced-circuit",
"processing-unit",
"space-science-pack",
}

local panel_ingredients = {}
local accu_ingredients = {}
local previous_price = 34.8
--local tier_multiplier = 7
local power_step = math.log(tier_multiplier,2)
local expo_step = math.log(tier_multiplier,1.71)
local beyond_mult = 3350^(1/1.075)/16
for i=1,4 do
	local power = 2^(power_step*i)
	local price = 34.8 * 2.4 ^(expo_step*i)
	if power > 16 then
		price = (power*beyond_mult)^1.075
	end
	local difference = price - previous_price* math.ceil(tier_multiplier)
	if i==4 then
		difference = difference*0.7853
	end
	panel_ingredients[i+1] = math.max(1,math.ceil( difference/prices[tier_ingredients[i]]))
	previous_price = price
	--game.print(i.." panel: "..price)
end
expo_step = math.log(tier_multiplier,1.95)
previous_price = 20
beyond_mult = 1950^(1/1.075)/16
for i=1,4 do
	local power = 2^(power_step*i)
	local price = 20 * 3 ^(expo_step*i)
	if power > 16 then
		price = (power*beyond_mult)^1.075
	end
	local difference = price - previous_price* math.ceil(tier_multiplier)
	if i==4 then
		difference = difference*0.7853
	end
	accu_ingredients[i+1] = math.max(1,math.ceil( difference/prices[tier_ingredients[i]]))
	--game.print(i.." accu: "..price)
	previous_price = price
end
--pow = 2
--price = 34.8 * 3
--pow = 4
--price = 34.8 * 3 ^2
--pow = 8
--price = 34.8 * 3 ^3
--pow = 16
--price = 34.8 * 3 ^4
--pow = 32
--price = 34.8 * 3 ^5
--pow = 64
--price = 34.8 * 3 ^6
--
--pow = 4
--price = 34.8 * 3 ^2
--pow = 16
--price = 34.8 * 3 ^4
--pow = 64
--price = 34.8 * 3 ^6
--
--pow = 8
--price = 34.8 * 3 ^3
--pow = 64
--price = 34.8 * 3 ^6

data:extend({
  cp_recipe_factory("solar-panel", 2, {"electronic-circuit", panel_ingredients[2]}),
  cp_recipe_factory("solar-panel", 3, {"advanced-circuit",   panel_ingredients[3]}),--50 20
  cp_recipe_factory("solar-panel", 4, {"processing-unit",    panel_ingredients[4]}),--100 40 20
  cp_recipe_factory("solar-panel", 5, {"space-science-pack", panel_ingredients[5]}),--200 80 55 (50)

  cp_recipe_factory("accumulator", 2, {"electronic-circuit", accu_ingredients[2]}),
  cp_recipe_factory("accumulator", 3, {"advanced-circuit",   accu_ingredients[3]}),
  cp_recipe_factory("accumulator", 4, {"processing-unit",    accu_ingredients[4]}),--80 30 15
  cp_recipe_factory("accumulator", 5, {"space-science-pack", accu_ingredients[5]})--160 60 45 (25)
})
