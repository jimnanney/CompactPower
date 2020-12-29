mod_name = "CompactPower2"
mod_prefix = "cp"
tier_multiplier = settings.startup["compactpower2-scale"].value


function mk2color(tier)
  return "mk"..tier
end

function tier_up_value(val, tier)
  return val * tier_multiplier^(tier-1)
end

function tiered_name(name, tier)
  if tier == 1 then
    return name
  else
    return mod_prefix .. "-" .. name .. "-mk"..tier
  end
end

function tiered_icon(name, tier)
  return "__" .. mod_name .. "__/graphics/icons/" .. name .. "/" .. name .. "-" .. mk2color(tier) .. ".png"
end

function tiered_entity_icon(name, tier)
  return "__" .. mod_name .. "__/graphics/entity/" .. name .. "/" .. name .. "-" .. mk2color(tier) .. ".png"
end

function tiered_accu_animation(name, anim, tier)
  return "__" .. mod_name .. "__/graphics/entity/" .. name .. "/" .. anim .. "-" .. mk2color(tier) .. ".png"
end


data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
data.raw["solar-panel"]["solar-panel"].next_upgrade = tiered_name("solar-panel", 2)
data.raw["solar-panel"]["solar-panel"].picture.layers[1] =
        {
          filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/1/solar-panel.png",
          priority = "high",
          width = 116,
          height = 112,
          shift = util.by_pixel(-3, 3),
          hr_version =
          {
            filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/1/hr-solar-panel.png",
            priority = "high",
            width = 230,
            height = 224,
            shift = util.by_pixel(-3, 3.5),
            scale = 0.5
          }
        }
data.raw.corpse["solar-panel-remnants"].animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/1/remnants/solar-panel-remnants.png",
      line_length = 1,
      width = 146,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(4, 0),
      hr_version =
      {
        filename = "__" .. mod_name .. "__/graphics/entity/solar-panel/1/remnants/hr-solar-panel-remnants.png",
        line_length = 1,
        width = 290,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3.5, 0),
        scale = 0.5,
      },
    })
		
data.raw["accumulator"]["accumulator"].fast_replaceable_group = "accumulator"
data.raw["accumulator"]["accumulator"].next_upgrade = tiered_name("accumulator", 2)

require("prototypes.entities")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
