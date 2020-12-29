function cp_tech_factory(name, unlocks, tier, n, ings, t, ordr)
  return cp_tech_factory_w_req(tiered_name(name, tier-1), name, unlocks, tier, n, ings, t)
end

function cp_tech_factory_w_req(req, name, unlocks, tier, n, ings, t, ordr)
  return {
    type = "technology",
    name = tiered_name(name, tier),
    icon = "__" .. mod_name .. "__/graphics/technology/" .. name .. "-" .. mk2color(tier) .. ".png",
    icon_size = 128,
    effects = {
      {
        type = "unlock-recipe",
        recipe = tiered_name(unlocks, tier)
      }
    },
    prerequisites = {req},
    unit = {
      count = n,
      ingredients = ings,
      time = t
    },
    order = ordr,
  }
end


data:extend({
  cp_tech_factory("solar-energy", "solar-panel", 2, 200,  {{"automation-science-pack", 2}, {"logistic-science-pack", 1}},                                                   100, "a-h-c"),
  cp_tech_factory("solar-energy", "solar-panel", 3, 250, {{"automation-science-pack", 2}, {"logistic-science-pack", 2}},                                                   200, "a-h-c"),
  cp_tech_factory("solar-energy", "solar-panel", 4, 400, {{"automation-science-pack", 2}, {"logistic-science-pack", 2}, {"chemical-science-pack", 1}},                            300, "a-h-c"),
  cp_tech_factory("solar-energy", "solar-panel", 5, 550, {{"automation-science-pack", 6}, {"logistic-science-pack", 4}, {"chemical-science-pack", 2}, {"space-science-pack", 1}}, 500, "a-h-c"),

  cp_tech_factory_w_req("electric-energy-accumulators", "electric-energy-accumulators", "accumulator", 2, 200,  {{"automation-science-pack", 2}, {"logistic-science-pack", 1}},           100, "c-e-a"),
  cp_tech_factory("electric-energy-accumulators", "accumulator", 3, 250, {{"automation-science-pack", 2}, {"logistic-science-pack", 2}},                                                   200, "c-e-a"),
  cp_tech_factory("electric-energy-accumulators", "accumulator", 4, 400, {{"automation-science-pack", 2}, {"logistic-science-pack", 2}, {"chemical-science-pack", 1}},                            300, "c-e-a"),
  cp_tech_factory("electric-energy-accumulators", "accumulator", 5, 550, {{"automation-science-pack", 6}, {"logistic-science-pack", 4}, {"chemical-science-pack", 2}, {"space-science-pack", 1}}, 500, "c-e-a")
})
