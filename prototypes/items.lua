function cp_item_factory(name, tier, sort_1)
  return {
      type = "item",
      icon_size = 32,
      name = tiered_name(name, tier),
      icon = tiered_icon(name, tier),
      --flags = {"goes-to-quickbar"},
      subgroup = "solarpower",
      order = sort_1 .. "[" .. tiered_name(name, tier) .. "]-a[" .. tiered_name(name, tier) .. "]",
      place_result = tiered_name(name, tier),
      stack_size = 50
  }
end

data:extend({
    {
		type = "item-subgroup",
		name = "solarpower",
		group = "production",
		order = "b",
	},
  cp_item_factory("solar-panel", 2, "dz"),
  cp_item_factory("solar-panel", 3, "dz"),
  cp_item_factory("solar-panel", 4, "dz"),
  cp_item_factory("solar-panel", 5, "dz"),

  cp_item_factory("accumulator", 2, "e"),
  cp_item_factory("accumulator", 3, "e"),
  cp_item_factory("accumulator", 4, "e"),
  cp_item_factory("accumulator", 5, "e")

})

data.raw.item["solar-panel"].subgroup = "solarpower"

data.raw.item["accumulator"].subgroup = "solarpower"
